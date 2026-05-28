import React, { useEffect, useState } from 'react'
import { reportApi } from '../api/api'

const s = {
  title:    { fontSize: '22px', fontWeight: 'bold', marginBottom: '20px', color: '#1e293b' },
  grid:     { display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '20px' },
  card:     { background: '#fff', borderRadius: '10px', padding: '20px', boxShadow: '0 1px 4px rgba(0,0,0,0.08)' },
  cardTitle:{ fontSize: '16px', fontWeight: '700', marginBottom: '14px', color: '#1e293b' },
  table:    { width: '100%', borderCollapse: 'collapse', fontSize: '13px' },
  th:       { textAlign: 'left', padding: '8px 10px', backgroundColor: '#f1f5f9', color: '#64748b', fontWeight: '600', borderBottom: '1px solid #e2e8f0' },
  td:       { padding: '8px 10px', borderBottom: '1px solid #f1f5f9', color: '#334155' },
  badge:    { padding: '2px 8px', borderRadius: '20px', fontSize: '11px', fontWeight: '600' }
}

function ReportTable({ title, columns, rows, emptyText = 'Sin datos' }) {
  return (
    <div style={s.card}>
      <p style={s.cardTitle}>{title}</p>
      <table style={s.table}>
        <thead>
          <tr>{columns.map(c => <th key={c.key} style={s.th}>{c.label}</th>)}</tr>
        </thead>
        <tbody>
          {rows.length === 0
            ? <tr><td colSpan={columns.length} style={{ ...s.td, textAlign: 'center', color: '#94a3b8' }}>{emptyText}</td></tr>
            : rows.map((row, i) => (
              <tr key={i}>
                {columns.map(c => <td key={c.key} style={s.td}>{c.render ? c.render(row[c.key], row) : row[c.key] ?? '-'}</td>)}
              </tr>
            ))
          }
        </tbody>
      </table>
    </div>
  )
}

export default function ReportsPage() {
  const [bestSelling,   setBestSelling]   = useState([])
  const [monthlyIncome, setMonthlyIncome] = useState([])
  const [topCustomers,  setTopCustomers]  = useState([])
  const [lowStock,      setLowStock]      = useState([])
  const [loading,       setLoading]       = useState(true)

  useEffect(() => {
    Promise.all([
      reportApi.bestSelling(),
      reportApi.monthlyIncome(),
      reportApi.topCustomers(),
      reportApi.lowStock()
    ]).then(([bs, mi, tc, ls]) => {
      setBestSelling(bs)
      setMonthlyIncome(mi)
      setTopCustomers(tc)
      setLowStock(ls)
    }).catch(console.error)
     .finally(() => setLoading(false))
  }, [])

  if (loading) return <p>Cargando reportes...</p>

  return (
    <div>
      <h1 style={s.title}>Reportes</h1>
      <div style={s.grid}>

        <ReportTable
          title="Productos mas vendidos"
          columns={[
            { key: 'productName', label: 'Producto' },
            { key: 'sku', label: 'SKU' },
            { key: 'totalSold', label: 'Vendidos', render: v => <strong>{v}</strong> }
          ]}
          rows={bestSelling}
        />

        <ReportTable
          title="Ingresos mensuales"
          columns={[
            { key: 'year',  label: 'Año' },
            { key: 'month', label: 'Mes' },
            { key: 'totalIncome', label: 'Ingresos', render: v => `$${Number(v).toLocaleString()}` }
          ]}
          rows={monthlyIncome}
        />

        <ReportTable
          title="Top clientes"
          columns={[
            { key: 'customerName',  label: 'Cliente' },
            { key: 'email',         label: 'Email' },
            { key: 'totalOrders',   label: 'Órdenes' },
            { key: 'totalSpent',    label: 'Total gastado', render: v => `$${Number(v).toLocaleString()}` }
          ]}
          rows={topCustomers}
        />

        <ReportTable
          title="Productos con stock bajo"
          columns={[
            { key: 'productName',  label: 'Producto' },
            { key: 'sku',          label: 'SKU' },
            { key: 'availableStock', label: 'Stock', render: (v) => (
              <span style={{ ...s.badge, background: v <= 2 ? '#fee2e2' : '#fef9c3', color: v <= 2 ? '#991b1b' : '#854d0e' }}>
                {v}
              </span>
            )},
            { key: 'minimumStock', label: 'Mínimo' }
          ]}
          rows={lowStock}
        />

      </div>
    </div>
  )
}
