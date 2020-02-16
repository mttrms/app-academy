export const signup = user => (
  fetch('/api/user/', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({user: user})
  })
  .then(handleErrors)
  .then(response => response.json())
)

export const login = user => (
  fetch('/api/session/', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({user: user})
  })
  .then(handleErrors)
  .then(response => response.json())
)

export const logout = () => (
  fetch('/api/session/', {
    method: 'DELETE'
  })
  .then(response => response.json())
)

const handleErrors = response => {
  if (!response.ok) {
    throw response;
  }
  return response;
};
