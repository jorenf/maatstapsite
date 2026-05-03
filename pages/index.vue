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
  script: [{
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
  }],
})

// Fetch from Directus — falls back to hardcoded defaults in each component if null
const { directusUrl } = useRuntimeConfig().public

const [heroData, statsData, testimonialsData] = await Promise.all([
  useAsyncData('hero', () =>
    $fetch(`${directusUrl}/items/hero`).catch(() => null)
  ),
  useAsyncData('stats', () =>
    $fetch(`${directusUrl}/items/stats?sort=sort`).catch(() => null)
  ),
  useAsyncData('testimonials', () =>
    $fetch(`${directusUrl}/items/testimonials?sort=sort`).catch(() => null)
  ),
])

const hero         = computed(() => (heroData.data.value as any)?.data)
const stats        = computed(() => (statsData.data.value as any)?.data)
const testimonials = computed(() => (testimonialsData.data.value as any)?.data)
</script>

<template>
  <div>
    <AppNav active="home" />
    <main>
      <HomeHero
        :headline="hero?.headline"
        :headline-accent="hero?.headline_accent"
        :subtext="hero?.subtext"
        :badge-text="hero?.badge_text"
        :cta-primary="hero?.cta_primary"
        :cta-secondary="hero?.cta_secondary"
        :trust1="hero?.trust_1"
        :trust2="hero?.trust_2"
        :trust3="hero?.trust_3"
      />
      <HomeSocialProof />
      <HomeStatsBento :stats="stats" />
      <HomeFeatures />
      <HomeHowItWorks />
      <HomePricingPreview />
      <HomeTestimonials :testimonials="testimonials" />
      <HomeCtaBanner />
    </main>
    <AppFooter />
  </div>
</template>
