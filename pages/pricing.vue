<script setup lang="ts">
const annual = ref(true)

useHead({
  title: 'Prijzen — Maatstap',
  meta: [
    { name: 'description', content: 'Eerlijke prijzen voor Maatstap ERP. Starter vanaf €89/mnd. Professional vanaf €249/mnd. Geen setup-fee, eerste 14 dagen gratis.' },
    { property: 'og:title', content: 'Prijzen — Maatstap' },
    { property: 'og:description', content: 'Eerlijke ERP-prijzen. Geen kleine lettertjes. Maandelijks opzegbaar.' },
  ],
  script: [
    {
      type: 'application/ld+json',
      innerHTML: JSON.stringify({
        '@context': 'https://schema.org',
        '@type': 'WebPage',
        name: 'Maatstap Prijzen',
        description: 'Transparante prijsopties voor het Maatstap ERP-platform',
      }),
    },
  ],
})
</script>

<template>
  <div>
    <AppNav active="pricing" />
    <main>
      <PricingHero :annual="annual" @update:annual="annual = $event" />
      <PricingCards :annual="annual" />
      <PricingComparisonTable />
      <PricingAddonsSection />
      <PricingFaqSection />
      <HomeCtaBanner />
    </main>
    <AppFooter />
  </div>
</template>
