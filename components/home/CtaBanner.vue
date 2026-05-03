<template>
  <section class="py-20">
    <div class="ms-container">
      <div class="rounded-3xl text-center relative overflow-hidden px-6 py-20 md:py-[88px] md:px-12" style="background:#0F172A">
        <div aria-hidden class="absolute animate-spin-slow pointer-events-none" style="top:50%;left:50%;width:800px;height:800px;transform:translate(-50%,-50%);background:conic-gradient(from 0deg,transparent,rgba(94,234,212,.18),transparent 30%,transparent 70%,rgba(94,234,212,.18),transparent)" />
        <div aria-hidden class="absolute inset-0 pointer-events-none" style="background:radial-gradient(ellipse 60% 80% at 50% 100%,rgba(94,234,212,0.25),transparent 70%)" />
        <div class="relative">
          <div class="inline-block text-[13px] font-medium px-3.5 py-1.5 rounded-full text-teal-300 mb-6" style="background:rgba(94,234,212,.14);letter-spacing:0.04em">↳ Klaar?</div>
          <h2 class="font-semibold text-white m-0 leading-[0.95]" style="font-size:clamp(36px,6vw,80px);letter-spacing:-0.035em">
            Stop met <span class="font-display text-teal-300">plakken</span>.<br />Begin met bouwen.
          </h2>
          <p class="text-[18px] text-slate-300 mt-5 mb-9 mx-auto leading-relaxed" style="max-width:540px">14 dagen gratis. Geen creditcard. Wij helpen met de migratie.</p>
          <div class="flex flex-col sm:flex-row gap-3 justify-center">
            <AppButton variant="light" size="lg" icon-right="arrowRight" href="/contact">Probeer gratis</AppButton>
            <AppButton variant="ghost" size="lg" href="/contact" style="color:#fff">Praat met ons →</AppButton>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
