const BASE = import.meta.env.VITE_API_URL || '/api'

class ApiError extends Error {
  constructor(message, status, details) {
    super(message)
    this.status = status
    this.details = details
  }
}

async function request(path, options = {}) {
  const res = await fetch(`${BASE}${path}`, {
    headers: { 'Content-Type': 'application/json', ...options.headers },
    ...options
  })
  if (!res.ok) {
    const body = await res.json().catch(() => null)
    const message = body?.message || body?.error || res.statusText || 'Error en la solicitud'
    throw new ApiError(message, res.status, body?.details)
  }
  const text = await res.text()
  return text ? JSON.parse(text) : null
}

const unpage = (resp) => Array.isArray(resp) ? resp : (resp?.content ?? [])

// ---------- PRODUCTOS ----------
export const productApi = {
  findAll:         (categoryId, page = 0, size = 15) => {
    const params = new URLSearchParams(Object.entries({ page, size, ...(categoryId ? { categoryId } : {}) }).map(([k, v]) => [k, String(v)]))
    return request(`/products?${params}`)
  },
  get:             (id)         => request(`/products/${id}`),
  create:          (data)       => request('/products', { method: 'POST', body: JSON.stringify(data) }),
  update:          (id, data)   => request(`/products/${id}`, { method: 'PUT', body: JSON.stringify(data) }),
  getSkusByCategory: (categoryId) => request(`/products/skus?categoryId=${categoryId}`),
  getInventory:    (id)         => request(`/products/${id}/inventory`),
  updateInventory: (id, data)   => request(`/products/${id}/inventory`, { method: 'PUT', body: JSON.stringify(data) })
}

// ---------- CATEGORIAS ----------
export const categoryApi = {
  findAll: () => request('/categories'),
  create:  (data) => request('/categories', { method: 'POST', body: JSON.stringify(data) }),
  delete:  (id)   => request(`/categories/${id}`, { method: 'DELETE' })
}

// ---------- ORDENES ----------
export const orderApi = {
  // Devuelve el Page completo { content, totalPages, number, ... }
  findAll:  (params = {}, page = 0, size = 15) => {
    const q = new URLSearchParams(Object.entries({ ...params, page, size }).filter(([, v]) => v !== '' && v != null))
    return request(`/orders${q.toString() ? '?' + q : ''}`)
  },
  get:      (id)   => request(`/orders/${id}`),
  create:   (data) => request('/orders', { method: 'POST', body: JSON.stringify(data) }),
  pay:      (id)   => request(`/orders/${id}/pay`, { method: 'PUT' }),
  ship:     (id)   => request(`/orders/${id}/ship`, { method: 'PUT' }),
  deliver:  (id)   => request(`/orders/${id}/deliver`, { method: 'PUT' }),
  cancel:   (id, note) => request(`/orders/${id}/cancel`, { method: 'PUT', body: JSON.stringify({ note }) })
}

// ---------- CLIENTES ----------
export const customerApi = {
  // Devuelve el Page completo { content, totalPages, number, ... }
  findAll:   (page = 0, size = 15) => request(`/customers?page=${page}&size=${size}`),
  get:       (id)       => request(`/customers/${id}`),
  create:    (data)     => request('/customers', { method: 'POST', body: JSON.stringify(data) }),
  update:    (id, data) => request(`/customers/${id}`, { method: 'PUT', body: JSON.stringify(data) }),
  addresses: (id)       => request(`/customers/${id}/addresses`)
}

// ---------- REPORTES ----------
export const reportApi = {
  bestSelling:   (limit = 10) => request(`/reports/best-selling-products?limit=${limit}`),
  monthlyIncome: ()           => request('/reports/monthly-income'),
  topCustomers:  (limit = 10) => request(`/reports/top-customers?limit=${limit}`),
  lowStock:      ()           => request('/reports/low-stock-products')
}

export { ApiError }
