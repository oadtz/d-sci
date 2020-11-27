// eslint-disable-next-line no-use-before-define
import React from 'react'
import Adapter from 'enzyme-adapter-react-16'
import { configure, shallow } from 'enzyme'
import Home from '@pages/index'

configure({ adapter: new Adapter() })

// jest.mock('react-i18next', () => ({
//   withTranslation: () => (component) => {
//     component.defaultProps = { ...component.defaultProps, t: () => '' }
//     return component
//   },
// }))

const wrapper = shallow(<Home />)

describe('Our Team', () => {
  it('Renders correctly', () => {
    expect(wrapper).toMatchSnapshot()
  })
})
