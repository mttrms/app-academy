export const signup = user => (
  fetch('/api/user/', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(user)
  })
  .then(response => response.json())
)

export const login = user => (
  fetch('/api/session/', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(user)
  })
  .then(response => response.json())
)

export const logout = () => (
  fetch('/api/session/', {
    method: 'DELETE'
  })
  .then(response => response.json())
)
