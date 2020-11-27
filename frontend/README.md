This is a [Next.js](https://nextjs.org/) project bootstrapped with [`create-next-app`](https://github.com/vercel/next.js/tree/canary/packages/create-next-app).

## Getting Started

First, run the development server:

```bash
npm run dev
# or
yarn dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

You can start editing the page by modifying `pages/index.js`. The page auto-updates as you edit the file.

## SECRETS variables

Name | Description
-----|------------
APP_DOMAIN_NAME | Full domain of the application
APP_EMAIL | Email that will be used for Letsencrypt
DOCKER_HUB_LOGIN | User for docker hub
DOCKER_HUB_SECRET | Password for docker hub
DOCKER_IMAGE_NAME | Name of docker repo/image of this code
AZURE_CREDENTIALS | Result from command ```az ad sp create-for-rbac --name "myApp" --role contributor \ --scopes /subscriptions/{subscription-id}/resourceGroups/{resource-group} \ --sdk-auth```
AZURE_RESOURCE_GROUP |
AZURE_ACI_NAME | Azure Container Group Name
AZURE_ACI_LOCATION | Location of the target Azure Container Instances, this will be a part of the final url name eg. ```southeast asia```
AZURE_FILE_VOLUME_ACCOUNT_NAME | Name of the az file volume account
AZURE_FILE_VOLUME_ACCOUNT_KEY | Key of the az file volume account
AZURE_FILE_VOLUME_SHARE_NAME | Name of the az files share
