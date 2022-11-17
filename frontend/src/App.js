import React from 'react'
import './index.scss'
import './App.scss'
import {
  getAllPF,
  getAuxRecPF,
  getAuxBusPF,
  getAuxOferecidos,
  getEmpOferecidos,
  getQuantAuxOferecidos,
} from './backend/requisitions'
import { createAux, createVagaEmp } from './backend/inserts'
import auxilios from './backend/auxilios.json'
import pessoas from './backend/pessoas.json'
import Table from './components/table'

const types = ['auxilios', 'pessoas']

export class App extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      type: '',
      list: [
        {
          id: 10,
          valor_mensal: 'R$1000.00',
          valor_total: 'R$12000.00',
          duracao_meses: 12,
        },
        {
          id: 11,
          valor_mensal: 'R$2000.00',
          valor_total: 'R$12000.00',
          duracao_meses: 6,
        },
      ],
      creatingAux: false,
      creatingEmp: false,
      propsAux: {
        valor_mensal: 0,
        valor_total: 0,
        duracao: 0,
      },
      propsEmp: {
        tipo_vaga: '',
        n_vagas: 0,
        local: '',
        horario: '',
        contato_entrevista: '',
        experiencia_exigiga: '',
        remuneracao: 0,
      },
    }
  }

  changeList = (getNewList) => {
    this.setState((prevState) => ({ ...prevState, creatingAux: false, creatingEmp: false }))
    this.setState((prevState) => {
      const newState = { ...prevState }
      newState.list = getNewList()
      return newState
    })
  }

  changeListMock = (type) => {
    this.setState((prevState) => ({ ...prevState, creatingAux: false, creatingEmp: false }))
    this.setState((prevState) => {
      const newState = { ...prevState }
      switch (type) {
        case 'auxilios':
          auxilios.forEach((auxilio) => {
            newState.list.push(auxilio)
          })
          break
        case 'pessoas':
          pessoas.forEach((pessoa) => {
            newState.list.push(pessoa)
          })
          break
        default:
          break
      }
    })
  }

  updateCreateAux = (saving = false) => {
    if (!saving) {
      this.setState((prevState) => ({ ...prevState, creatingEmp: false }))
    }
    this.setState((prevState) => {
      const newState = { ...prevState }
      newState.creatingAux = !saving
      return newState
    })

    if (saving) createAux(this.state.propsAux)
  }

  updateCreateEmp = (saving = false) => {
    if (!saving) {
      this.setState((prevState) => ({ ...prevState, creatingAux: false }))
    }
    this.setState((prevState) => {
      const newState = { ...prevState }

      newState.creatingEmp = !saving
      return newState
    })

    if (saving) createVagaEmp(this.state.propsEmp)
  }

  changeProp = (typeProp, fieldProp, value) => {
    this.setState((prevState) => {
      const newState = { ...prevState }
      newState[typeProp][fieldProp] = value
      return newState
    })
  }

  render() {
    const { type } = this.state
    return (
      <div className="container">
        <h1>UTOPIA DB</h1>
        <section className="menu">
          <h1>Listar:</h1>
          <div>
            <button onClick={() => this.setState({ type: 'pessoas', creatingEmp: false, creatingAux: false })}>
              Pessoas físicas
            </button>
            <button onClick={() => this.changeListMock(getAuxRecPF)}>Pessoas e seus auxílios recebidos</button>
            <button onClick={() => this.changeList(getAuxBusPF)}>Pessoas e seus auxílios buscados</button>
            <button onClick={() => this.changeList(getEmpOferecidos)}>Vagas de emprego oferecidas</button>
            {/* <button onClick={() => this.changeList(getQuantAuxOferecidos)}>Quantidade de auxílios oferecidos</button> */}
            <button onClick={() => this.setState({ type: 'auxilios', creatingEmp: false, creatingAux: false })}>
              Auxílios oferecidos
            </button>
          </div>
          <h1>Criar:</h1>
          <div>
            <button onClick={() => this.updateCreateEmp()}>Vaga de emprego</button>
            <button onClick={() => this.updateCreateAux()}>Auxílio</button>
          </div>
        </section>

        {this.state.creatingAux && (
          <form className="styledForm" onSubmit={() => this.updateCreateAux(true)}>
            <label>Valor mensal: </label>
            <input required onChange={(value) => this.changeProp('propsAux', 'valor_mensal', value.target.value)} />
            <label>Valor total: </label>
            <input required onChange={(value) => this.changeProp('propsAux', 'valor_total', value.target.value)} />
            <label>Duração (em meses): </label>
            <input
              required
              type="number"
              onChange={(value) => this.changeProp('propsAux', 'duracao', value.target.value)}
            />
            <button type="submit" onSubmit={() => this.updateCreateAux(true)}>
              Criar Auxílio
            </button>
          </form>
        )}

        {this.state.creatingEmp && (
          <form className="styledForm" onSubmit={() => this.updateCreateEmp(true)}>
            <label>Tipo da vaga:</label>
            <input required onChange={(value) => this.changeProp('propsEmp', 'tipo_vaga', value.target.value)} />
            <label>Número de vagas:</label>
            <input
              required
              type="number"
              onChange={(value) => this.changeProp('propsEmp', 'n_vagas', value.target.value)}
            />
            <label>Local:</label>
            <input required onChange={(value) => this.changeProp('propsEmp', 'local', value.target.value)} />
            <label>Horário:</label>
            <input required onChange={(value) => this.changeProp('propsEmp', 'horario', value.target.value)} />
            <label>Contato para entrevista: </label>
            <input
              required
              onChange={(value) => this.changeProp('propsEmp', 'contato_entrevista', value.target.value)}
            />
            <label>Experiência exigida: </label>
            <input
              required
              onChange={(value) => this.changeProp('propsEmp', 'experiencia_exigida', value.target.value)}
            />
            <label>Remuneração: </label>
            <input required onChange={(value) => this.changeProp('propsEmp', 'remuneracao', value.target.value)} />
            <button type="submit" value="Submit">
              Cadastrar Emprego
            </button>
          </form>
        )}

        {!(this.state.creatingEmp || this.state.creatingAux) && (
          <Table type={type} data={type === 'pessoas' ? pessoas : auxilios} />
        )}
        {/* <table>
            <tr>
              <th>ID</th>
              <th>Valor Mensal</th>
              <th>Valor Total</th>
              <th>Duracao (meses)</th>
            </tr>
            {auxilios.map((auxilio) => (
              <tr>
                <td>{auxilio.id}</td>
                <td>{auxilio.valor_mensal}</td>
                <td>{auxilio.valor_total}</td>
                <td>{auxilio.duracao_meses}</td>
              </tr>
            ))}
            <tr></tr>
          </table> */}
      </div>
    )
  }
}
