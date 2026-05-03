<template>
  <section class="relative overflow-hidden pt-16 pb-20">
    <!-- Background blobs -->
    <div aria-hidden class="absolute inset-0 z-0 pointer-events-none">
      <div
        class="absolute left-1/2 -translate-x-1/2"
        style="top:-120px;width:1200px;height:600px;background:radial-gradient(ellipse at center,rgba(94,234,212,.4),transparent 60%)"
      />
      <div
        class="absolute rounded-full"
        style="top:200px;right:-100px;width:400px;height:400px;background:radial-gradient(circle,rgba(45,212,191,.25),transparent 70%)"
      />
    </div>

    <div class="ms-container relative z-10 text-center">
      <!-- Announcement pill -->
      <a
        href="#"
        class="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-white border border-slate-200 text-[13px] font-medium text-slate-700 mb-7"
        style="box-shadow:0 1px 2px rgba(15,23,42,.04)"
      >
        <span
          class="inline-flex w-2 h-2 rounded-full bg-teal-500"
          style="box-shadow:0 0 0 4px rgba(20,184,166,.2)"
        />
        Klantportaal v2 net gelanceerd
        <span class="px-2.5 py-1 rounded-full bg-slate-900 text-white font-medium text-[12px] inline-flex items-center gap-1">
          Bekijk →
        </span>
      </a>

      <!-- Headline -->
      <h1
        class="font-semibold m-0 mx-auto"
        style="font-size:clamp(48px,8vw,104px);letter-spacing:-0.045em;line-height:0.95;max-width:1100px"
      >
        ERP zonder<br />
        de <span
          class="font-display text-teal-700 relative inline-block"
          style="font-size:1.05em"
        >chaos</span><span aria-hidden class="text-teal-500">.</span>
      </h1>

      <p
        class="text-slate-600 mx-auto mt-7 leading-snug font-normal"
        style="font-size:clamp(17px,1.6vw,22px);max-width:580px"
      >
        Offertes, orders, voorraad, klanten.
        <strong class="text-slate-900 font-semibold">Eén plek.</strong>
        Geen Excel-spaghetti, geen 2003-energy. Gewoon werk dat klopt.
      </p>

      <!-- CTAs -->
      <div class="flex gap-3 justify-center mt-9 flex-wrap">
        <AppButton variant="dark" size="lg" icon-right="arrowRight" href="/contact">
          Probeer gratis
        </AppButton>
        <AppButton variant="outline" size="lg" href="/contact">
          Boek een demo
        </AppButton>
      </div>

      <!-- Trust signals -->
      <div class="mt-4 text-[13px] text-slate-500 flex justify-center gap-4 flex-wrap">
        <span class="inline-flex items-center gap-1.5">
          <AppIcon name="check" :size="14" color="#0D9488" />14 dagen gratis
        </span>
        <span class="inline-flex items-center gap-1.5">
          <AppIcon name="check" :size="14" color="#0D9488" />Geen creditcard
        </span>
        <span class="inline-flex items-center gap-1.5">
          <AppIcon name="check" :size="14" color="#0D9488" />Servers in NL 🇳🇱
        </span>
      </div>

      <!-- Mockup with floating stickers -->
      <div class="mt-16 relative inline-block" style="perspective:1600px">
        <!-- Stickers -->
        <div
          class="absolute animate-bob"
          style="top:-22px;left:-60px;transform:rotate(-8deg);background:#5EEAD4;color:#0F172A;padding:10px 16px;border-radius:9999px;font-size:14px;font-weight:600;letter-spacing:-0.01em;box-shadow:0 8px 24px -6px rgba(15,23,42,.18),0 0 0 1px rgba(15,23,42,.04);white-space:nowrap"
        >⚡ 30s offerte</div>
        <div
          class="absolute animate-bob"
          style="top:40px;right:-90px;transform:rotate(6deg);background:#0F172A;color:#fff;padding:10px 16px;border-radius:9999px;font-size:14px;font-weight:600;letter-spacing:-0.01em;box-shadow:0 8px 24px -6px rgba(15,23,42,.18);white-space:nowrap;animation-delay:1s"
        >Live levertijd</div>
        <div
          class="absolute animate-bob"
          style="bottom:120px;left:-100px;transform:rotate(-3deg);background:#fff;color:#0F172A;padding:10px 16px;border-radius:9999px;font-size:14px;font-weight:600;box-shadow:0 8px 24px -6px rgba(15,23,42,.18);white-space:nowrap;animation-delay:2s"
        >📦 8 modules</div>
        <div
          class="absolute animate-bob"
          style="bottom:-16px;right:-40px;transform:rotate(5deg);background:#CCFBF1;color:#134E4A;padding:10px 16px;border-radius:9999px;font-size:14px;font-weight:600;box-shadow:0 8px 24px -6px rgba(15,23,42,.18);white-space:nowrap;animation-delay:3s"
        >+12% omzet</div>

        <!-- Mockup scaled for viewport -->
        <div
          class="inline-block"
          style="transform-style:preserve-3d;transform:rotateX(2deg);filter:drop-shadow(0 40px 60px rgba(15,23,42,.18))"
        >
          <div class="overflow-hidden rounded-xl" style="max-width:min(1100px,calc(100vw - 48px));transform-origin:top left;transform:scale(min(1,(100vw - 48px)/1100))">
            <HomeErpMockup />
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
