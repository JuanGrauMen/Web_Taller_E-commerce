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
  pagination: { display: 'flex', justifyContent: 'center', alignItems: 'center', gap: '12px', marginTop: '16px' },
  pageBtn: { padding: '6px 14px', borderRadius: '6px', border: '1px solid #cbd5e1', cursor: 'pointer', fontSize: '13px', fontWeight: '600', backgroundColor: '#fff', color: '#475569' }
}

const emptyForm = { categoryId: '', name: '', sku: '', price: '', description: '', availableStock: '', minimumStock: '' }
const PAGE_SIZE = 15

function categoryPrefix(categoryName) {
  return categoryName
    .normalize('NFD')
    .replace(/[̀-ͯ]/g, '')
    .replace(/[^a-zA-Z ]/g, '')
    .trim()
    .split(/\s+/)[0]
    .toUpperCase()
    .slice(0, 3)
}

export default function ProductsPage() {
  const [products, setProducts]     = useState([])
  const [totalPages, setTotalPages] = useState(0)
  const [page, setPage]             = useState(0)
  const [categories, setCategories] = useState([])
  const [form, setForm]             = useState(emptyForm)
  const [skuLoading, setSkuLoading] = useState(false)
  const [filterCat, setFilterCat]   = useState('')
  const [editId, setEditId]         = useState(null)
  const [editData, setEditData]     = useState({})
  const [error, setError]           = useState('')
  const [loading, setLoading]       = useState(true)

  const load = (p = page, catId = filterCat) => {
    setLoading(true)
    productApi.findAll(catId || undefined, p, PAGE_SIZE)
      .then(data => {
        setProducts(data.content ?? [])
        setTotalPages(data.totalPages ?? 0)
      })
      .catch(e => setError(e.message))
      .finally(() => setLoading(false))
  }

  const goToPage = (p) => { setPage(p); load(p) }

  useEffect(() => {
    categoryApi.findAll().then(setCategories).catch(() => {})
    load(0)
  }, [])

  const handleSubmit = async (e) => {
    e.preventDefault()
    setError('')
    try {
      await productApi.create({
        categoryId:     Number(form.categoryId),
        name:           form.name,
        sku:            form.sku,
        price:          Number(form.price),
        description:    form.description || undefined,
        availableStock: Number(form.availableStock) || 0,
        minimumStock:   Number(form.minimumStock)   || 0
      })
      setForm(emptyForm)
      load(page)
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
      load(page)
    } catch (e) { setError(e.message) }
  }

  const startEdit = (p) => {
    setEditId(p.id)
    setEditData({ name: p.name, price: p.price, active: p.active })
  }

  const generateSku = async (catId, catName) => {
    if (!catId || !catName) return
    const prefix = categoryPrefix(catName)
    setSkuLoading(true)
    try {
      const skus = await productApi.getSkusByCategory(catId)
      const re   = new RegExp(`^${prefix}-(\\d+)$`, 'i')
      let max = 0
      for (const sku of skus) {
        const m = sku.match(re)
        if (m) max = Math.max(max, parseInt(m[1], 10))
      }
      const next = String(max + 1).padStart(3, '0')
      setForm(f => ({ ...f, sku: `${prefix}-${next}` }))
    } catch {
      setForm(f => ({ ...f, sku: `${prefix}-001` }))
    } finally {
      setSkuLoading(false)
    }
  }

  const handleCategoryChange = (e) => {
    const catId = e.target.value
    const cat   = categories.find(c => String(c.id) === catId)
    setForm(f => ({ ...f, categoryId: catId, sku: '' }))
    if (cat) generateSku(catId, cat.name)
  }

  const handleFilterChange = (catId) => {
    setFilterCat(catId)
    setPage(0)
    load(0, catId)
  }

  return (
    <div>
      <h1 style={s.title}>Productos</h1>

      <div style={s.card}>
        <h3 style={{ margin: '0 0 14px', color: '#475569', fontSize: '15px' }}>Nuevo Producto</h3>
        <form onSubmit={handleSubmit} style={s.form}>
          <select style={s.input} value={form.categoryId} onChange={handleCategoryChange} required>
            <option value="">Categoría</option>
            {categories.map(c => <option key={c.id} value={c.id}>{c.name}</option>)}
          </select>
          <input style={s.input} placeholder="Nombre" value={form.name} onChange={e => setForm({ ...form, name: e.target.value })} required />
          <input
            style={{ ...s.input, backgroundColor: '#f8fafc', color: '#64748b', cursor: 'default' }}
            placeholder={skuLoading ? 'Generando...' : 'SKU (elige categoría)'}
            value={form.sku}
            readOnly
            required
          />
          <input style={s.input} placeholder="Precio" type="number" min="0.01" step="0.01" value={form.price} onChange={e => setForm({ ...form, price: e.target.value })} required />
          <input style={{ ...s.input, minWidth: '110px' }} placeholder="Stock" type="number" min="0" value={form.availableStock} onChange={e => setForm({ ...form, availableStock: e.target.value })} />
          <input style={{ ...s.input, minWidth: '110px' }} placeholder="Mínimo" type="number" min="0" value={form.minimumStock} onChange={e => setForm({ ...form, minimumStock: e.target.value })} />
          <input style={s.input} placeholder="Descripción (opcional)" value={form.description} onChange={e => setForm({ ...form, description: e.target.value })} />
          <button type="submit" style={{ ...s.btn, ...s.btnBlue }}>Crear</button>
        </form>
        {error && <p style={s.error}>{error}</p>}
      </div>

      <div style={s.card}>
        <div style={{ display: 'flex', gap: '10px', marginBottom: '14px', alignItems: 'center', justifyContent: 'space-between' }}>
          <div style={{ display: 'flex', gap: '10px', alignItems: 'center' }}>
            <select style={s.input} value={filterCat} onChange={e => handleFilterChange(e.target.value)}>
              <option value="">Todas las categorías</option>
              {categories.map(c => <option key={c.id} value={c.id}>{c.name}</option>)}
            </select>
            <button style={{ ...s.btn, ...s.btnGray }} onClick={() => load(page)}>Actualizar</button>
          </div>
          <span style={{ fontSize: '13px', color: '#64748b' }}>Página {page + 1} de {totalPages || 1}</span>
        </div>

        {loading ? <p>Cargando...</p> : (
          <>
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
                        ? <input style={{ ...s.input, padding: '4px 8px', minWidth: '150px' }}
                            value={editData.name}
                            onChange={e => setEditData({ ...editData, name: e.target.value })} />
                        : <strong>{p.name}</strong>}
                    </td>
                    <td style={s.td}><code>{p.sku}</code></td>
                    <td style={s.td}>{p.categoryName}</td>
                    <td style={s.td}>
                      {editId === p.id
                        ? <input style={{ ...s.input, padding: '4px 8px', width: '110px' }}
                            type="number" min="0.01" step="0.01" value={editData.price}
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

            {totalPages > 1 && (
              <div style={s.pagination}>
                <button style={{ ...s.pageBtn, ...(page === 0 ? { opacity: 0.4, cursor: 'not-allowed' } : {}) }}
                  disabled={page === 0} onClick={() => goToPage(page - 1)}>← Anterior</button>
                {Array.from({ length: totalPages }, (_, i) => i).map(i => (
                  <button key={i}
                    style={{ ...s.pageBtn, ...(i === page ? { backgroundColor: '#3b82f6', color: '#fff', borderColor: '#3b82f6' } : {}) }}
                    onClick={() => goToPage(i)}>{i + 1}</button>
                ))}
                <button style={{ ...s.pageBtn, ...(page >= totalPages - 1 ? { opacity: 0.4, cursor: 'not-allowed' } : {}) }}
                  disabled={page >= totalPages - 1} onClick={() => goToPage(page + 1)}>Siguiente →</button>
              </div>
            )}
          </>
        )}
      </div>
    </div>
  )
}
