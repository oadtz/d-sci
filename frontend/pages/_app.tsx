import { FunctionComponent } from 'react'
import '../styles/globals.css'

const MyApp: FunctionComponent<{ Component; pageProps }> = ({ Component, pageProps }) => {
  return <Component {...pageProps} />
}

export default MyApp
