// eslint-disable-next-line no-use-before-define
import React from 'react'
import Head from 'next/head'
import SEO from '@components/Layout/SEO'

const Layout: React.FunctionComponent = ({ children }) => (
  <>
    <Head>
      <meta name="viewport" content="width=device-width, initial-scale=1" />
    </Head>
    <SEO />
    {children}
  </>
)

export default Layout
