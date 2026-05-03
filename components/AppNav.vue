<script setup lang="ts">
defineProps<{ active?: string }>()

const links = [
  { key: 'home', label: 'Product', href: '/' },
  { key: 'pricing', label: 'Prijzen', href: '/pricing' },
  { key: 'customers', label: 'Klanten', href: '/klanten' },
  { key: 'contact', label: 'Contact', href: '/contact' },
]
</script>

<template>
  <header class="sticky top-4 z-50 px-4">
    <div
      class="ms-container flex items-center h-[60px] gap-2 pl-5 pr-2"
      style="
        background: rgba(255,255,255,0.85);
        backdrop-filter: saturate(180%) blur(16px);
        border: 1px solid #E2E8F0;
        border-radius: 9999px;
        box-shadow: 0 8px 24px -8px rgba(15,23,42,.08), 0 2px 4px -1px rgba(15,23,42,.04);
        max-width: 1100px;
      "
    >
      <NuxtLink to="/" class="inline-flex">
        <AppLogo :size="24" />
      </NuxtLink>

      <nav class="flex gap-0.5 ml-5">
        <NuxtLink
          v-for="l in links"
          :key="l.key"
          :to="l.href"
          :class="[
            'text-[15px] font-medium px-3.5 py-2 rounded-lg transition-colors',
            active === l.key ? 'text-slate-900' : 'text-slate-600 hover:text-slate-900',
          ]"
        >
          {{ l.label }}
        </NuxtLink>
      </nav>

      <div class="flex-1" />

      <NuxtLink to="#" class="text-sm font-medium text-slate-700 px-3">
        Inloggen
      </NuxtLink>
      <AppButton variant="dark" size="sm" icon-right="arrowRight" href="/contact">
        Demo
      </AppButton>
    </div>
  </header>
</template>
