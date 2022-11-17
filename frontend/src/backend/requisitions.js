import axios from 'axios'

const PORT = 8989

export const getAllPF = () => axios
  .get(`http://localhost:${PORT}/tables/entidade_pessoa_fisica`)
  .then(function (response) {
    // handle success
    console.log(response)
    return response
  })
  .catch(function (error) {
    // handle error
    console.log(error)
  })

export const getAuxRecPF = () => axios
  .get(`http://localhost:${PORT}/tables/rel_pessoa_usa_auxilio`)
  .then(function (response) {
    // handle success
    console.log(response)
    return response
  })
  .catch(function (error) {
    // handle error
    console.log(error)
  })

export const getAuxBusPF = () => axios
  .get(`http://localhost:${PORT}/tables/rel_pessoa_busca_auxilio`)
  .then(function (response) {
    // handle success
    console.log(response)
    return response
  })
  .catch(function (error) {
    // handle error
    console.log(error)
  })

// -- Relação de todos os governos com suas ofertas de vagas de emprego
export const getEmpOferecidos = () => axios
  .get(`http://localhost:${PORT}/tables/vaga_emprego`)
  .then(function (response) {
    // handle success
    console.log(response)
    return response
  })
  .catch(function (error) {
    // handle error
    console.log(error)
  })

// -- Relação de todos os governos com a quantidade de auxilios oferecidos
export const getQuantAuxOferecidos = () => axios
  .get(`http://localhost:${PORT}/tables/`)
  .then(function (response) {
    // handle success
    console.log(response)
    return response
  })
  .catch(function (error) {
    // handle error
    console.log(error)
  })

// -- Relação de todos os governos com seus auxílios oferecidos
export const getAuxOferecidos = () => axios
  .get(`http://localhost:${PORT}/tables/auxilio`)
  .then(function (response) {
    // handle success
    console.log(response)
    return response
  })
  .catch(function (error) {
    // handle error
    console.log(error)
  })