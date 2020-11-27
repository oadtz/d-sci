// eslint-disable-next-line no-use-before-define
import React from 'react'
import { NextSeo } from 'next-seo'
import { useRouter } from 'next/router'

interface ISEOProps {
  title?: string
  description?: string
  url?: string
  previewImage?: string
}

const SEO: React.FunctionComponent<ISEOProps> = ({ title, description, previewImage }) => {
  const router = useRouter()

  const url = process.env.NEXT_PUBLIC_SITE_URL + router.basePath + router.pathname

  return (
    <NextSeo
      title={title}
      description={description}
      canonical={process.env.NEXT_PUBLIC_SITE_URL + router.basePath}
      openGraph={{
        url,
        title,
        description,
        images: [{ url: previewImage && process.env.NEXT_PUBLIC_SITE_URL + previewImage }],
        site_name: title,
      }}
      twitter={{
        handle: '@handle',
        site: '@site',
        cardType: 'summary_large_image',
      }}
    />
  )
}

export default SEO
