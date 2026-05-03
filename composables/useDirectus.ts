import {
  createDirectus,
  rest,
  staticToken,
  readSingleton,
  readItems,
  createItem,
} from '@directus/sdk'

export type DirectusClient = ReturnType<typeof buildClient>

function buildClient() {
  const config = useRuntimeConfig()
  const url = config.public.directusUrl as string
  const token = (config.directusToken || config.public.directusToken) as string

  const client = token
    ? createDirectus(url).with(staticToken(token)).with(rest())
    : createDirectus(url).with(rest())

  return client
}

export const useDirectus = () => buildClient()

// Safe fetch — returns null instead of throwing when Directus is unreachable
export async function safeRead<T>(fn: () => Promise<T>): Promise<T | null> {
  try {
    return await fn()
  } catch {
    return null
  }
}

export { readSingleton, readItems, createItem }
