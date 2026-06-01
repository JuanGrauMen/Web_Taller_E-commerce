import React, { useEffect, useState } from 'react'
import { productApi, categoryApi } from '../api/api'

const s = {
  title:   { fontSize: '22px', fontWeight: 'bold', marginBottom: '20px', color: '#1e293b' },
  card:    { background: '#fff', borderRadius: '10px', padding: '20px', marginBottom: '20px', boxShadow: '0 1px 4px rgba(0,0,0,0.08)' },
  form:    { display: 'flex', gap: '10px', flexWrap: 'wrap', alignItems: 'flex-end' },
  input:   { padding: '8px 12px', borderRadius: '6px', border: '1px solid #cbd5e1', fontSize: '14px', minWidth: '160px' },
  btn:     { padding: '8px 18px', borderRadius: '6px', border: 'none', cursor: 'pointer', fontSize: '14px', fontWeight: '600' },
  btnBlue: { backgroundColor: '#3b82f6', color: '#fff' },
  btnGray: { backgroundColor: '#e2e8f0', color: '#475569' },
  table:   { width: '100%', borderCollapse: 'collapse', fontSize: '14px' },
  th:      { textAlign: 'left', padding: '10px 12px', backgroundColor: '#f1f5f9', color: '#64748b', fontWeight: '600', borderBottom: '1px solid #e2e8f0' },
  td:      { padding: '10px 12px', borderBottom: '1px solid #f1f5f9', color: '#334155', verticalAlign: 'middle' },
  badge:   { padding: '2px 10px', borderRadius: '20px', fontSize: '12px', fontWeight: '600' },
  error:   { color: '#ef4444', marginTop: '8px', fontSize: '13px' },
  count:   { fontSize: '13px', color: '#64748b' }
}

const emptyForm = { categoryId: '', name: '', sku: '', price: '', description: '' }

export default function ProductsPage() {
  const [products, setProducts]     = useState([])
  const [categories, setCategories] = useState([])
  const [form, setForm]             = useState(emptyForm)
  const [filterCat, setFilterCat]   = useState('')
  const [editId, setEditId]         = useState(null)
  const [editData, setEditData]     = useState({})
  const [error, setError]           = useState('')
  const [loading, setLoading]       = useState(true)

  const load = (catId = filterCat) => {
    setLoading(true)
    productApi.findAll(catId || undefined)
      .then(setProducts)
      .catch(e => setError(e.message))
      .finally(() => setLoading(false))
  }

  useEffect(() => {
    categoryApi.findAll().then(setCategories).catch(() => {})
    load()
  }, [])

  const handleSubmit = async (e) => {
    e.preventDefault()
    setError('')
    try {
      await productApi.create({
        categoryId: Number(form.categoryId),
        name: form.name,
        sku: form.sku,
        price: Number(form.price),
        description: form.description || undefined
      })
      setForm(emptyForm)
      load()
    } catch (e) { setError(e.message) }
  }

  const handleUpdate = async (id) => {
    setError('')
    try {
      await productApi.update(id, {
        name:   editData.name,
        price:  Number(editData.price),
        active: editData.active === 'true' || editData.active === true
      })
      setEditId(null)
      load()
    } catch (e) { setError(e.message) }
  }

  const startEdit = (p) => {
    setEditId(p.id)
    setEditData({ name: p.name, price: p.price, active: p.active })
  }

  return (
    <div>
      <h1 style={s.title}>Productos</h1>

      <div style={s.card}>
        <h3 style={{ margin: '0 0 14px', color: '#475569', fontSize: '15px' }}>Nuevo Producto</h3>
        <form onSubmit={handleSubmit} style={s.form}>
          <select style={s.input} value={form.categoryId} onChange={e => setForm({ ...form, categoryId: e.target.value })} required>
            <option value="">Categoría</option>
            {categories.map(c => <option key={c.id} value={c.id}>{c.name}</option>)}
          </select>
          <input style={s.input} placeholder="Nombre" value={form.name} onChange={e => setForm({ ...form, name: e.target.value })} required />
          <input style={s.input} placeholder="SKU" value={form.sku} onChange={e => setForm({ ...form, sku: e.target.value })} required />
          <input style={s.input} placeholder="Precio" type="number" value={form.price} onChange={e => setForm({ ...form, price: e.target.value })} required />
          <input style={s.input} placeholder="Descripción" value={form.description} onChange={e => setForm({ ...form, description: e.target.value })} />
          <button type="submit" style={{ ...s.btn, ...s.btnBlue }}>Crear</button>
        </form>
        {error && <p style={s.error}>{error}</p>}
      </div>

      <div style={s.card}>
        <div style={{ display: 'flex', gap: '10px', marginBottom: '14px', alignItems: 'center', justifyContent: 'space-between' }}>
          <div style={{ display: 'flex', gap: '10px', alignItems: 'center' }}>
            <select style={s.input} value={filterCat} onChange={e => { setFilterCat(e.target.value); load(e.target.value) }}>
              <option value="">Todas las categorías</option>
              {categories.map(c => <option key={c.id} value={c.id}>{c.name}</option>)}
            </select>
            <button style={{ ...s.btn, ...s.btnGray }} onClick={() => load()}>Actualizar</button>
          </div>
          {!loading && (
            <span style={s.count}>
              {products.length} producto{products.length !== 1 ? 's' : ''}
              {filterCat ? ' en esta categoría' : ' en total'}
            </span>
          )}
        </div>

        {loading ? <p>Cargando...</p> : (
          <table style={s.table}>
            <thead>
              <tr>
                <th style={s.th}>ID</th>
                <th style={s.th}>Nombre</th>
                <th style={s.th}>SKU</th>
                <th style={s.th}>Categoría</th>
                <th style={s.th}>Precio</th>
                <th style={s.th}>Estado</th>
                <th style={s.th}>Acciones</th>
              </tr>
            </thead>
            <tbody>
              {products.length === 0 ? (
                <tr><td colSpan={7} style={{ ...s.td, textAlign: 'center', color: '#94a3b8' }}>Sin productos</td></tr>
              ) : products.map(p => (
                <tr key={p.id}>
                  <td style={s.td}>{p.id}</td>
                  <td style={s.td}>
                    {editId === p.id
                      ? <input style={{ ...s.input, padding: '4px 8px', minWidth: '160px' }}
                          value={editData.name}
                          onChange={e => setEditData({ ...editData, name: e.target.value })} />
                      : <strong>{p.name}</strong>}
                  </td>
                  <td style={s.td}><code>{p.sku}</code></td>
                  <td style={s.td}>{p.categoryName}</td>
                  <td style={s.td}>
                    {editId === p.id
                      ? <input style={{ ...s.input, padding: '4px 8px', width: '110px' }}
                          type="number" value={editData.price}
                          onChange={e => setEditData({ ...editData, price: e.target.value })} />
                      : `$${Number(p.price).toLocaleString()}`}
                  </td>
                  <td style={s.td}>
                    {editId === p.id
                      ? <select style={{ ...s.input, padding: '4px 8px' }}
                          value={String(editData.active)}
                          onChange={e => setEditData({ ...editData, active: e.target.value })}>
                          <option value="true">Activo</option>
                          <option value="false">Inactivo</option>
                        </select>
                      : <span style={{ ...s.badge, background: p.active ? '#dcfce7' : '#fee2e2', color: p.active ? '#166534' : '#991b1b' }}>
                          {p.active ? 'Activo' : 'Inactivo'}
                        </span>}
                  </td>
                  <td style={s.td}>
                    {editId === p.id ? (
                      <>
                        <button style={{ ...s.btn, ...s.btnBlue, padding: '4px 12px', fontSize: '12px', marginRight: '6px' }}
                          onClick={() => handleUpdate(p.id)}>Guardar</button>
                        <button style={{ ...s.btn, ...s.btnGray, padding: '4px 12px', fontSize: '12px' }}
                          onClick={() => setEditId(null)}>Cancelar</button>
                      </>
                    ) : (
                      <button style={{ ...s.btn, ...s.btnGray, padding: '4px 12px', fontSize: '12px' }}
                        onClick={() => startEdit(p)}>Editar</button>
                    )}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </div>
    </div>
  )
}
