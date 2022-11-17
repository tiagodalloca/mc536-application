import axios from 'axios'

const PORT = 8989

export const createAux = (auxilio) =>
  axios
    .post(`http://localhost:${PORT}`, auxilio)
    .then(function (response) {
      // handle success
      console.log(response)
      return response
    })
    .catch(function (error) {
      // handle error
      console.log(error)
    })

export const createVagaEmp = (vagaEmp) =>
  axios
    .post(`http://localhost:${PORT}/URI`, vagaEmp)
    .then(function (response) {
      // handle success
      console.log(response)
      return response
    })
    .catch(function (error) {
      // handle error
      console.log(error)
    })
