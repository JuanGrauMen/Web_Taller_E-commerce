import React, { useEffect, useState } from 'react'
import { customerApi } from '../api/api'

const s = {
  title:   { fontSize: '22px', fontWeight: 'bold', marginBottom: '20px', color: '#1e293b' },
  card:    { background: '#fff', borderRadius: '10px', padding: '20px', marginBottom: '20px', boxShadow: '0 1px 4px rgba(0,0,0,0.08)' },
  form:    { display: 'flex', gap: '10px', flexWrap: 'wrap', alignItems: 'flex-end' },
  input:   { padding: '8px 12px', borderRadius: '6px', border: '1px solid #cbd5e1', fontSize: '14px', minWidth: '180px' },
  btn:     { padding: '8px 18px', borderRadius: '6px', border: 'none', cursor: 'pointer', fontSize: '14px', fontWeight: '600' },
  btnBlue: { backgroundColor: '#3b82f6', color: '#fff' },
  btnGray: { backgroundColor: '#e2e8f0', color: '#475569' },
  btnRed:  { backgroundColor: '#fee2e2', color: '#991b1b' },
  table:   { width: '100%', borderCollapse: 'collapse', fontSize: '14px' },
  th:      { textAlign: 'left', padding: '10px 12px', backgroundColor: '#f1f5f9', color: '#64748b', fontWeight: '600', borderBottom: '1px solid #e2e8f0' },
  td:      { padding: '10px 12px', borderBottom: '1px solid #f1f5f9', color: '#334155' },
  badge:   { padding: '2px 10px', borderRadius: '20px', fontSize: '12px', fontWeight: '600' },
  error:   { color: '#ef4444', marginTop: '8px', fontSize: '13px' },
  pagination: { display: 'flex', justifyContent: 'center', alignItems: 'center', gap: '12px', marginTop: '16px' },
  pageBtn: { padding: '6px 14px', borderRadius: '6px', border: '1px solid #cbd5e1', cursor: 'pointer', fontSize: '13px', fontWeight: '600', backgroundColor: '#fff', color: '#475569' },
  pageBtnDisabled: { opacity: 0.4, cursor: 'not-allowed' },
  pageInfo: { fontSize: '13px', color: '#64748b' }
}

const emptyForm = { fullName: '', email: '' }
const PAGE_SIZE = 15

export default function CustomersPage() {
  const [customers, setCustomers] = useState([])
  const [totalPages, setTotalPages] = useState(0)
  const [page, setPage]           = useState(0)
  const [form, setForm]           = useState(emptyForm)
  const [editId, setEditId]       = useState(null)
  const [editData, setEditData]   = useState({})
  const [error, setError]         = useState('')
  const [loading, setLoading]     = useState(true)

  const load = (p = page) => {
    setLoading(true)
    customerApi.findAll(p, PAGE_SIZE)
      .then(data => {
        setCustomers(data.content ?? [])
        setTotalPages(data.totalPages ?? 0)
      })
      .catch(e => setError(e.message))
      .finally(() => setLoading(false))
  }

  useEffect(() => { load(0) }, [])

  const goToPage = (p) => {
    setPage(p)
    load(p)
  }

  const handleCreate = async (e) => {
    e.preventDefault()
    setError('')
    try {
      await customerApi.create({ fullName: form.fullName, email: form.email })
      setForm(emptyForm)
      load(page)
    } catch (e) { setError(e.message) }
  }

  const handleUpdate = async (id) => {
    setError('')
    try {
      await customerApi.update(id, editData)
      setEditId(null)
      load(page)
    } catch (e) { setError(e.message) }
  }

  return (
    <div>
      <h1 style={s.title}>Clientes</h1>

      <div style={s.card}>
        <h3 style={{ margin: '0 0 14px', color: '#475569', fontSize: '15px' }}>Nuevo Cliente</h3>
        <form onSubmit={handleCreate} style={s.form}>
          <input style={s.input} placeholder="Nombre completo" value={form.fullName}
            onChange={e => setForm({ ...form, fullName: e.target.value })} required />
          <input style={s.input} placeholder="Email" type="email" value={form.email}
            onChange={e => setForm({ ...form, email: e.target.value })} required />
          <button type="submit" style={{ ...s.btn, ...s.btnBlue }}>Crear</button>
        </form>
        {error && <p style={s.error}>{error}</p>}
      </div>

      <div style={s.card}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '12px' }}>
          <span style={{ fontSize: '13px', color: '#64748b' }}>
            Página {page + 1} de {totalPages || 1}
          </span>
          <button style={{ ...s.btn, ...s.btnGray }} onClick={() => load(page)}>Actualizar</button>
        </div>

        {loading ? <p>Cargando...</p> : (
          <>
            <table style={s.table}>
              <thead>
                <tr>
                  <th style={s.th}>ID</th>
                  <th style={s.th}>Nombre</th>
                  <th style={s.th}>Email</th>
                  <th style={s.th}>Estado</th>
                  <th style={s.th}>Acciones</th>
                </tr>
              </thead>
              <tbody>
                {customers.length === 0 ? (
                  <tr><td colSpan={5} style={{ ...s.td, textAlign: 'center', color: '#94a3b8' }}>Sin clientes</td></tr>
                ) : customers.map(c => (
                  <tr key={c.id}>
                    <td style={s.td}>{c.id}</td>
                    <td style={s.td}>
                      {editId === c.id
                        ? <input style={{ ...s.input, padding: '4px 8px', minWidth: '140px' }}
                            value={editData.fullName || ''}
                            onChange={e => setEditData({ ...editData, fullName: e.target.value })} />
                        : c.fullName}
                    </td>
                    <td style={s.td}>{c.email}</td>
                    <td style={s.td}>
                      {editId === c.id
                        ? <select style={{ ...s.input, padding: '4px 8px' }}
                            value={editData.status || c.status}
                            onChange={e => setEditData({ ...editData, status: e.target.value })}>
                            <option value="ACTIVE">ACTIVE</option>
                            <option value="INACTIVE">INACTIVE</option>
                          </select>
                        : <span style={{ ...s.badge, background: c.status === 'ACTIVE' ? '#dcfce7' : '#fee2e2', color: c.status === 'ACTIVE' ? '#166534' : '#991b1b' }}>
                            {c.status}
                          </span>
                      }
                    </td>
                    <td style={s.td}>
                      {editId === c.id ? (
                        <>
                          <button style={{ ...s.btn, ...s.btnBlue, padding: '4px 12px', fontSize: '12px', marginRight: '6px' }}
                            onClick={() => handleUpdate(c.id)}>Guardar</button>
                          <button style={{ ...s.btn, ...s.btnGray, padding: '4px 12px', fontSize: '12px' }}
                            onClick={() => setEditId(null)}>Cancelar</button>
                        </>
                      ) : (
                        <button style={{ ...s.btn, ...s.btnGray, padding: '4px 12px', fontSize: '12px' }}
                          onClick={() => { setEditId(c.id); setEditData({ fullName: c.fullName, status: c.status }) }}>
                          Editar
                        </button>
                      )}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>

            {/* Paginación */}
            {totalPages > 1 && (
              <div style={s.pagination}>
                <button
                  style={{ ...s.pageBtn, ...(page === 0 ? s.pageBtnDisabled : {}) }}
                  disabled={page === 0}
                  onClick={() => goToPage(page - 1)}>
                  ← Anterior
                </button>

                {Array.from({ length: totalPages }, (_, i) => i).map(i => (
                  <button
                    key={i}
                    style={{ ...s.pageBtn, ...(i === page ? { backgroundColor: '#3b82f6', color: '#fff', borderColor: '#3b82f6' } : {}) }}
                    onClick={() => goToPage(i)}>
                    {i + 1}
                  </button>
                ))}

                <button
                  style={{ ...s.pageBtn, ...(page >= totalPages - 1 ? s.pageBtnDisabled : {}) }}
                  disabled={page >= totalPages - 1}
                  onClick={() => goToPage(page + 1)}>
                  Siguiente →
                </button>
              </div>
            )}
          </>
        )}
      </div>
    </div>
  )
}
