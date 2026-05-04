<script setup lang="ts">
const annual = ref(true)

useHead({
  title: 'Prijzen — Maatstap',
  meta: [
    { name: 'description', content: 'Eerlijke prijzen voor Maatstap ERP. Starter vanaf €89/mnd. Professional vanaf €249/mnd. Geen setup-fee, eerste 14 dagen gratis.' },
    { property: 'og:title', content: 'Prijzen — Maatstap' },
  ],
})

const config = useRuntimeConfig()
const { directusUrl } = config.public
const headers = computed(() => config.directusToken ? { Authorization: `Bearer ${config.directusToken}` } : {})

const [plansData, faqsData] = await Promise.all([
  useAsyncData('pricing_plans', () =>
    $fetch(`${directusUrl}/items/pricing_plans?sort=sort`, { headers: headers.value }).catch(() => null)
  ),
  useAsyncData('faqs', () =>
    $fetch(`${directusUrl}/items/faqs?sort=sort`, { headers: headers.value }).catch(() => null)
  ),
])

const plans = computed(() => (plansData.data.value as any)?.data)
const faqs  = computed(() => (faqsData.data.value as any)?.data)
</script>

<template>
  <div>
    <AppNav active="pricing" />
    <main>
      <PricingHero :annual="annual" @update:annual="annual = $event" />
      <PricingCards :annual="annual" :plans="plans" />
      <PricingComparisonTable />
      <PricingAddonsSection />
      <PricingFaqSection :faqs="faqs" />
      <HomeCtaBanner />
    </main>
    <AppFooter />
  </div>
</template>
