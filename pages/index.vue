<script setup lang="ts">
useHead({
  title: 'Maatstap — ERP zonder de chaos',
  meta: [
    { name: 'description', content: 'Maatstap is het ERP-platform voor productie- en groothandelsbedrijven. Offertes, orders, voorraad en klanten in één systeem. Gebouwd in Nederland.' },
    { property: 'og:title', content: 'Maatstap — ERP zonder de chaos' },
    { property: 'og:description', content: 'Maatstap is het ERP-platform voor productie- en groothandelsbedrijven. Offertes, orders, voorraad en klanten in één systeem.' },
    { property: 'og:type', content: 'website' },
    { name: 'twitter:card', content: 'summary_large_image' },
  ],
  script: [
    {
      type: 'application/ld+json',
      innerHTML: JSON.stringify({
        '@context': 'https://schema.org',
        '@type': 'SoftwareApplication',
        name: 'Maatstap',
        applicationCategory: 'BusinessApplication',
        description: 'ERP-platform voor productie- en groothandelsbedrijven',
        operatingSystem: 'Web',
        offers: [
          { '@type': 'Offer', price: '89', priceCurrency: 'EUR', name: 'Starter' },
          { '@type': 'Offer', price: '249', priceCurrency: 'EUR', name: 'Professional' },
        ],
      }),
    },
  ],
})
</script>

<template>
  <div>
    <AppNav active="home" />
    <main>
      <HomeHero />
      <HomeSocialProof />
      <HomeStatsBento />
      <HomeFeatures />
      <HomeHowItWorks />
      <HomePricingPreview />
      <HomeTestimonials />
      <HomeCtaBanner />
    </main>
    <AppFooter />
  </div>
</template>
