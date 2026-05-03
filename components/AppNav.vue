<script setup lang="ts">
defineProps<{ active?: string }>()

const links = [
  { key: 'home',     label: 'Product',  href: '/' },
  { key: 'pricing',  label: 'Prijzen',  href: '/pricing' },
  { key: 'customers',label: 'Klanten',  href: '#' },
  { key: 'contact',  label: 'Contact',  href: '/contact' },
]

const open = ref(false)
</script>

<template>
  <header class="sticky top-4 z-50 px-4">
    <div
      class="ms-container flex items-center h-[60px] gap-2 pl-5 pr-2"
      style="background:rgba(255,255,255,0.85);backdrop-filter:saturate(180%) blur(16px);border:1px solid #E2E8F0;border-radius:9999px;box-shadow:0 8px 24px -8px rgba(15,23,42,.08),0 2px 4px -1px rgba(15,23,42,.04);max-width:1100px"
    >
      <NuxtLink to="/" class="inline-flex flex-shrink-0">
        <AppLogo :size="24" />
      </NuxtLink>

      <!-- Desktop nav -->
      <nav class="hidden md:flex gap-0.5 ml-5">
        <NuxtLink
          v-for="l in links"
          :key="l.key"
          :to="l.href"
          :class="['text-[15px] font-medium px-3.5 py-2 rounded-lg transition-colors', active === l.key ? 'text-slate-900' : 'text-slate-600 hover:text-slate-900']"
        >{{ l.label }}</NuxtLink>
      </nav>

      <div class="flex-1" />

      <a href="#" class="hidden md:block text-sm font-medium text-slate-700 px-3">Inloggen</a>
      <AppButton variant="dark" size="sm" icon-right="arrowRight" href="/contact" class="hidden md:inline-flex">Demo</AppButton>

      <!-- Mobile hamburger -->
      <button
        class="md:hidden w-10 h-10 flex items-center justify-center rounded-xl text-slate-700 hover:bg-slate-100 transition-colors mr-1"
        @click="open = !open"
      >
        <AppIcon :name="open ? 'x' : 'menu'" :size="20" />
      </button>
    </div>

    <!-- Mobile dropdown -->
    <div
      v-if="open"
      class="md:hidden ms-container mt-2 rounded-2xl bg-white border border-slate-200 p-4 flex flex-col gap-1"
      style="max-width:1100px;box-shadow:0 8px 24px -8px rgba(15,23,42,.12)"
    >
      <NuxtLink
        v-for="l in links"
        :key="l.key"
        :to="l.href"
        class="text-[15px] font-medium px-4 py-3 rounded-xl text-slate-700 hover:bg-slate-50 transition-colors"
        @click="open = false"
      >{{ l.label }}</NuxtLink>
      <div class="border-t border-slate-100 mt-2 pt-3 flex flex-col gap-2">
        <a href="#" class="text-[15px] font-medium px-4 py-3 rounded-xl text-slate-700 hover:bg-slate-50 transition-colors">Inloggen</a>
        <AppButton variant="dark" size="md" icon-right="arrowRight" href="/contact" :full="true">Demo aanvragen</AppButton>
      </div>
    </div>
  </header>
</template>
