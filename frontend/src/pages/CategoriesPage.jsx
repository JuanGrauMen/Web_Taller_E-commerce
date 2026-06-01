import React, { useEffect, useState } from 'react'
import { categoryApi } from '../api/api'

const s = {
  title: { fontSize: '22px', fontWeight: 'bold', marginBottom: '20px', color: '#1e293b' },
  card:  { background: '#fff', borderRadius: '10px', padding: '20px', marginBottom: '20px', boxShadow: '0 1px 4px rgba(0,0,0,0.08)' },
  form:  { display: 'flex', gap: '10px', alignItems: 'flex-end' },
  input: { padding: '8px 12px', borderRadius: '6px', border: '1px solid #cbd5e1', fontSize: '14px', minWidth: '220px' },
  btn:   { padding: '8px 18px', borderRadius: '6px', border: 'none', cursor: 'pointer', fontSize: '14px', fontWeight: '600', backgroundColor: '#3b82f6', color: '#fff' },
  btnRed:{ padding: '4px 12px', borderRadius: '6px', border: 'none', cursor: 'pointer', fontSize: '12px', fontWeight: '600', backgroundColor: '#fee2e2', color: '#991b1b' },
  table: { width: '100%', borderCollapse: 'collapse', fontSize: '14px' },
  th:    { textAlign: 'left', padding: '10px 12px', backgroundColor: '#f1f5f9', color: '#64748b', fontWeight: '600', borderBottom: '1px solid #e2e8f0' },
  td:    { padding: '10px 12px', borderBottom: '1px solid #f1f5f9', color: '#334155' },
  error: { color: '#ef4444', marginTop: '8px', fontSize: '13px' }
}

export default function CategoriesPage() {
  const [categories, setCategories]   = useState([])
  const [name, setName]               = useState('')
  const [description, setDescription] = useState('')
  const [error, setError]             = useState('')

  const load = () => categoryApi.findAll().then(setCategories).catch(e => setError(e.message))

  useEffect(() => { load() }, [])

  const handleSubmit = async (e) => {
    e.preventDefault()
    setError('')
    try {
      await categoryApi.create({ name, description: description || undefined })
      setName('')
      setDescription('')
      load()
    } catch (e) { setError(e.message) }
  }

  const handleDelete = async (id, catName) => {
    if (!window.confirm(`¿Desactivar la categoría "${catName}"?\nNo se puede eliminar si tiene productos activos.`)) return
    setError('')
    try {
      await categoryApi.delete(id)
      load()
    } catch (e) { setError(e.message) }
  }

  return (
    <div>
      <h1 style={s.title}>Categorias</h1>

      <div style={s.card}>
        <h3 style={{ margin: '0 0 14px', color: '#475569', fontSize: '15px' }}>Nueva Categoría</h3>
        <form onSubmit={handleSubmit} style={s.form}>
          <input style={s.input} placeholder="Nombre" value={name} onChange={e => setName(e.target.value)} required />
          <input style={s.input} placeholder="Descripción" value={description} onChange={e => setDescription(e.target.value)} />
          <button type="submit" style={s.btn}>Crear</button>
        </form>
        {error && <p style={s.error}>{error}</p>}
      </div>

      <div style={s.card}>
        <table style={s.table}>
          <thead>
            <tr>
              <th style={s.th}>ID</th>
              <th style={s.th}>Nombre</th>
              <th style={s.th}>Descripción</th>
              <th style={s.th}>Acción</th>
            </tr>
          </thead>
          <tbody>
            {categories.length === 0 ? (
              <tr><td colSpan={4} style={{ ...s.td, textAlign: 'center', color: '#94a3b8' }}>Sin categorías</td></tr>
            ) : categories.map(c => (
              <tr key={c.id}>
                <td style={s.td}>{c.id}</td>
                <td style={s.td}><strong>{c.name}</strong></td>
                <td style={s.td}>{c.description || '-'}</td>
                <td style={s.td}>
                  <button style={s.btnRed} onClick={() => handleDelete(c.id, c.name)}>
                    Eliminar
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  )
}
