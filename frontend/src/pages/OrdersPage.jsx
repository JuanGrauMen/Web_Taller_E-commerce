import React, { useEffect, useState } from 'react'
import { orderApi } from '../api/api'

const STATUS_COLORS = {
  CREATED:   { bg: '#dbeafe', color: '#1d4ed8' },
  PAID:      { bg: '#dcfce7', color: '#166534' },
  SHIPPED:   { bg: '#fef9c3', color: '#854d0e' },
  DELIVERED: { bg: '#d1fae5', color: '#065f46' },
  CANCELLED: { bg: '#fee2e2', color: '#991b1b' }
}

const s = {
  title:   { fontSize: '22px', fontWeight: 'bold', marginBottom: '20px', color: '#1e293b' },
  card:    { background: '#fff', borderRadius: '10px', padding: '20px', marginBottom: '20px', boxShadow: '0 1px 4px rgba(0,0,0,0.08)' },
  input:   { padding: '8px 12px', borderRadius: '6px', border: '1px solid #cbd5e1', fontSize: '14px' },
  btn:     { padding: '6px 14px', borderRadius: '6px', border: 'none', cursor: 'pointer', fontSize: '13px', fontWeight: '600' },
  btnBlue: { backgroundColor: '#3b82f6', color: '#fff' },
  btnGray: { backgroundColor: '#e2e8f0', color: '#475569' },
  btnRed:  { backgroundColor: '#fee2e2', color: '#991b1b' },
  table:   { width: '100%', borderCollapse: 'collapse', fontSize: '14px' },
  th:      { textAlign: 'left', padding: '10px 12px', backgroundColor: '#f1f5f9', color: '#64748b', fontWeight: '600', borderBottom: '1px solid #e2e8f0' },
  td:      { padding: '10px 12px', borderBottom: '1px solid #f1f5f9', color: '#334155', verticalAlign: 'middle' },
  badge:   { padding: '3px 10px', borderRadius: '20px', fontSize: '12px', fontWeight: '600' },
  error:   { color: '#ef4444', fontSize: '13px', marginTop: '6px' }
}

const STATUSES = ['', 'CREATED', 'PAID', 'SHIPPED', 'DELIVERED', 'CANCELLED']

export default function OrdersPage() {
  const [orders, setOrders]     = useState([])
  const [filter, setFilter]     = useState({ customerId: '', status: '' })
  const [error, setError]       = useState('')
  const [loading, setLoading]   = useState(true)
  const [cancelNote, setCancelNote] = useState({})

  const load = async () => {
    setLoading(true)
    setError('')
    try {
      const data = await orderApi.findAll(filter)
      setOrders(data)
    } catch (e) { setError(e.message) }
    finally { setLoading(false) }
  }

  useEffect(() => { load() }, [])

  const action = async (fn, ...args) => {
    setError('')
    try { await fn(...args); load() }
    catch (e) { setError(e.message) }
  }

  const renderActions = (o) => {
    const actions = []
    if (o.status === 'CREATED')  actions.push(<button key="pay"  style={{ ...s.btn, ...s.btnBlue, marginRight: '6px' }} onClick={() => action(orderApi.pay, o.id)}>Pagar</button>)
    if (o.status === 'PAID')     actions.push(<button key="ship" style={{ ...s.btn, ...s.btnBlue, marginRight: '6px' }} onClick={() => action(orderApi.ship, o.id)}>Enviar</button>)
    if (o.status === 'SHIPPED')  actions.push(<button key="del"  style={{ ...s.btn, ...s.btnBlue, marginRight: '6px' }} onClick={() => action(orderApi.deliver, o.id)}>Entregar</button>)
    if (['CREATED','PAID'].includes(o.status)) {
      actions.push(
        <span key="cancel" style={{ display: 'inline-flex', gap: '4px', alignItems: 'center' }}>
          <input style={{ ...s.input, padding: '4px 8px', width: '120px', fontSize: '12px' }}
            placeholder="Motivo..." value={cancelNote[o.id] || ''} onChange={e => setCancelNote({ ...cancelNote, [o.id]: e.target.value })} />
          <button style={{ ...s.btn, ...s.btnRed }} onClick={() => action(orderApi.cancel, o.id, cancelNote[o.id])}>Cancelar</button>
        </span>
      )
    }
    return actions
  }

  return (
    <div>
      <h1 style={s.title}>Ordenes</h1>

      <div style={s.card}>
        <div style={{ display: 'flex', gap: '10px', flexWrap: 'wrap', alignItems: 'flex-end' }}>
          <input style={s.input} placeholder="ID Cliente" type="number" value={filter.customerId}
            onChange={e => setFilter({ ...filter, customerId: e.target.value })} />
          <select style={s.input} value={filter.status} onChange={e => setFilter({ ...filter, status: e.target.value })}>
            {STATUSES.map(st => <option key={st} value={st}>{st || 'Todos los estados'}</option>)}
          </select>
          <button style={{ ...s.btn, ...s.btnBlue }} onClick={load}>Filtrar</button>
          <button style={{ ...s.btn, ...s.btnGray }} onClick={() => { setFilter({ customerId: '', status: '' }); setTimeout(load, 50) }}>Limpiar</button>
        </div>
        {error && <p style={s.error}>{error}</p>}
      </div>

      <div style={s.card}>
        {loading ? <p>Cargando...</p> : (
          <table style={s.table}>
            <thead>
              <tr>
                <th style={s.th}>ID</th>
                <th style={s.th}>Cliente</th>
                <th style={s.th}>Estado</th>
                <th style={s.th}>Total</th>
                <th style={s.th}>Fecha</th>
                <th style={s.th}>Acciones</th>
              </tr>
            </thead>
            <tbody>
              {orders.length === 0 ? (
                <tr><td colSpan={6} style={{ ...s.td, textAlign: 'center', color: '#94a3b8' }}>Sin órdenes</td></tr>
              ) : orders.map(o => {
                const col = STATUS_COLORS[o.status] || { bg: '#f1f5f9', color: '#475569' }
                return (
                  <tr key={o.id}>
                    <td style={s.td}>#{o.id}</td>
                    <td style={s.td}>{o.customerName}</td>
                    <td style={s.td}>
                      <span style={{ ...s.badge, background: col.bg, color: col.color }}>{o.status}</span>
                    </td>
                    <td style={s.td}>${Number(o.total).toLocaleString()}</td>
                    <td style={s.td}>{o.createdAt ? new Date(o.createdAt).toLocaleDateString() : '-'}</td>
                    <td style={s.td}>{renderActions(o)}</td>
                  </tr>
                )
              })}
            </tbody>
          </table>
        )}
      </div>
    </div>
  )
}
