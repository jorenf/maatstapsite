<script setup lang="ts">
defineProps<{
  headline?: string
  headlineAccent?: string
  subtext?: string
  badgeText?: string
  ctaPrimary?: string
  ctaSecondary?: string
  trust1?: string
  trust2?: string
  trust3?: string
}>()
</script>

<template>
  <section class="relative overflow-hidden pt-16 pb-20">
    <!-- Background blobs -->
    <div aria-hidden class="absolute inset-0 z-0 pointer-events-none">
      <div class="absolute left-1/2 -translate-x-1/2" style="top:-120px;width:1200px;height:600px;background:radial-gradient(ellipse at center,rgba(94,234,212,.4),transparent 60%)" />
      <div class="absolute rounded-full" style="top:200px;right:-100px;width:400px;height:400px;background:radial-gradient(circle,rgba(45,212,191,.25),transparent 70%)" />
    </div>

    <div class="ms-container relative z-10 text-center">
      <!-- Badge -->
      <a href="#" class="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-white border border-slate-200 text-[13px] font-medium text-slate-700 mb-7" style="box-shadow:0 1px 2px rgba(15,23,42,.04)">
        <span class="inline-flex w-2 h-2 rounded-full bg-teal-500" style="box-shadow:0 0 0 4px rgba(20,184,166,.2)" />
        {{ badgeText || 'Klantportaal v2 net gelanceerd' }}
        <span class="px-2.5 py-1 rounded-full bg-slate-900 text-white font-medium text-[12px]">Bekijk →</span>
      </a>

      <!-- Headline -->
      <h1 class="font-semibold m-0 mx-auto" style="font-size:clamp(48px,8vw,104px);letter-spacing:-0.045em;line-height:0.95;max-width:1100px">
        {{ headline || 'ERP zonder' }}<br />
        de <span class="font-display text-teal-700 relative inline-block" style="font-size:1.05em">{{ headlineAccent || 'chaos' }}</span><span aria-hidden class="text-teal-500">.</span>
      </h1>

      <p class="text-slate-600 mx-auto mt-7 leading-snug font-normal" style="font-size:clamp(17px,1.6vw,22px);max-width:580px">
        {{ subtext || 'Offertes, orders, voorraad, klanten. Eén plek. Geen Excel-spaghetti, geen 2003-energy. Gewoon werk dat klopt.' }}
      </p>

      <!-- CTAs -->
      <div class="flex flex-col sm:flex-row gap-3 justify-center mt-9 px-4 sm:px-0">
        <AppButton variant="dark" size="lg" icon-right="arrowRight" href="/contact">{{ ctaPrimary || 'Probeer gratis' }}</AppButton>
        <AppButton variant="outline" size="lg" href="/contact">{{ ctaSecondary || 'Boek een demo' }}</AppButton>
      </div>

      <!-- Trust -->
      <div class="mt-4 text-[13px] text-slate-500 flex flex-wrap justify-center gap-x-4 gap-y-2 px-4">
        <span class="inline-flex items-center gap-1.5"><AppIcon name="check" :size="14" color="#0D9488" />{{ trust1 || '14 dagen gratis' }}</span>
        <span class="inline-flex items-center gap-1.5"><AppIcon name="check" :size="14" color="#0D9488" />{{ trust2 || 'Geen creditcard' }}</span>
        <span class="inline-flex items-center gap-1.5"><AppIcon name="check" :size="14" color="#0D9488" />{{ trust3 || 'Servers in NL 🇳🇱' }}</span>
      </div>

      <!-- Mockup — hidden on mobile, visible md+ -->
      <div class="hidden md:block mt-16 relative" style="perspective:1600px">
        <!-- Stickers -->
        <div class="absolute animate-bob" style="top:-22px;left:-60px;transform:rotate(-8deg);background:#5EEAD4;color:#0F172A;padding:10px 16px;border-radius:9999px;font-size:14px;font-weight:600;box-shadow:0 8px 24px -6px rgba(15,23,42,.18);white-space:nowrap">⚡ 30s offerte</div>
        <div class="absolute animate-bob" style="top:40px;right:-90px;transform:rotate(6deg);background:#0F172A;color:#fff;padding:10px 16px;border-radius:9999px;font-size:14px;font-weight:600;box-shadow:0 8px 24px -6px rgba(15,23,42,.18);white-space:nowrap;animation-delay:1s">Live levertijd</div>
        <div class="absolute animate-bob" style="bottom:120px;left:-100px;transform:rotate(-3deg);background:#fff;color:#0F172A;padding:10px 16px;border-radius:9999px;font-size:14px;font-weight:600;box-shadow:0 8px 24px -6px rgba(15,23,42,.18);white-space:nowrap;animation-delay:2s">📦 8 modules</div>
        <div class="absolute animate-bob" style="bottom:-16px;right:-40px;transform:rotate(5deg);background:#CCFBF1;color:#134E4A;padding:10px 16px;border-radius:9999px;font-size:14px;font-weight:600;box-shadow:0 8px 24px -6px rgba(15,23,42,.18);white-space:nowrap;animation-delay:3s">+12% omzet</div>

        <div class="inline-block overflow-hidden" style="transform-style:preserve-3d;transform:rotateX(2deg);filter:drop-shadow(0 40px 60px rgba(15,23,42,.18));max-width:calc(100vw - 48px)">
          <div style="transform-origin:top left;transform:scale(min(1,(100vw - 48px)/1100))">
            <HomeErpMockup />
          </div>
        </div>
      </div>

      <!-- Mobile: simple product preview card instead of full mockup -->
      <div class="md:hidden mt-12 mx-auto max-w-sm rounded-2xl border border-slate-200 bg-white overflow-hidden" style="box-shadow:0 24px 48px -12px rgba(15,23,42,.12)">
        <div class="bg-slate-50 border-b border-slate-200 px-4 py-3 flex items-center gap-2">
          <span class="w-2.5 h-2.5 rounded-full bg-[#FF5F57]" />
          <span class="w-2.5 h-2.5 rounded-full bg-[#FEBC2E]" />
          <span class="w-2.5 h-2.5 rounded-full bg-[#28C840]" />
          <span class="flex-1 text-center text-[11px] text-slate-500">app.maatstap.nl</span>
        </div>
        <div class="p-5">
          <div class="text-[13px] font-semibold mb-3 text-slate-900">Goedemiddag, Martijn</div>
          <div class="grid grid-cols-2 gap-2 mb-3">
            <div v-for="k in [['Omzet','€ 248K',true],['Offertes','12',false],['Marge','29%',true],['Leveren','6',false]]" :key="k[0]" class="bg-slate-50 rounded-lg p-3">
              <div class="text-[10px] text-slate-500">{{ k[0] }}</div>
              <div class="text-[18px] font-semibold tracking-tight">{{ k[1] }}</div>
            </div>
          </div>
          <div class="h-px bg-slate-100 mb-3" />
          <div v-for="r in [['OFF-2026-0148','Jansen Tech.','€ 12.4K','open'],['OFF-2026-0146','Havens Infra','€ 8.6K','won']]" :key="r[0]" class="flex items-center gap-2 py-1.5 text-[12px]">
            <div class="flex-1"><div class="font-mono font-semibold text-[10px]">{{ r[0] }}</div><div class="text-slate-500 text-[10px]">{{ r[1] }}</div></div>
            <div class="font-semibold">{{ r[2] }}</div>
            <span class="px-1.5 py-0.5 rounded text-[10px] font-semibold" :class="r[3]==='won'?'bg-teal-50 text-teal-700':'bg-amber-50 text-amber-800'">{{ r[3]==='won'?'Akkoord':'Open' }}</span>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
