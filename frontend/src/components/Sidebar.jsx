import React from 'react'
import { NavLink } from 'react-router-dom'

const links = [
  { to: '/products',   label: 'Productos' },
  { to: '/categories', label: 'Categorias' },
  { to: '/orders',     label: 'Ordenes' },
  { to: '/customers',  label: 'Clientes' },
  { to: '/reports',    label: 'Reportes' },
]

const styles = {
  sidebar: {
    width: '220px',
    minHeight: '100vh',
    backgroundColor: '#1e293b',
    padding: '0',
    display: 'flex',
    flexDirection: 'column'
  },
  header: {
    padding: '24px 20px 16px',
    color: '#fff',
    fontSize: '18px',
    fontWeight: 'bold',
    borderBottom: '1px solid #334155'
  },
  badge: {
    display: 'inline-block',
    background: '#3b82f6',
    color: '#fff',
    fontSize: '10px',
    padding: '2px 7px',
    borderRadius: '10px',
    marginLeft: '8px',
    verticalAlign: 'middle'
  },
  nav: { display: 'flex', flexDirection: 'column', padding: '12px 0' },
  link: {
    display: 'block',
    padding: '11px 20px',
    color: '#94a3b8',
    textDecoration: 'none',
    fontSize: '14px',
    transition: 'background 0.15s, color 0.15s'
  },
  activeLink: {
    color: '#fff',
    backgroundColor: '#3b82f6',
    borderRadius: '0'
  }
}

export default function Sidebar() {
  return (
    <aside style={styles.sidebar}>
      <div style={styles.header}>
        Tienda Universitaria
        <span style={styles.badge}>ADMIN</span>
      </div>
      <nav style={styles.nav}>
        {links.map(({ to, label }) => (
          <NavLink
            key={to}
            to={to}
            style={({ isActive }) =>
              isActive ? { ...styles.link, ...styles.activeLink } : styles.link
            }
          >
            {label}
          </NavLink>
        ))}
      </nav>
    </aside>
  )
}
