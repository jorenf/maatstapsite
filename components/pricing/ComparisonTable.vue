<script setup lang="ts">
const categories = [
  { cat: 'Basis', rows: [['Gebruikers','5','25','Onbeperkt'],['Klanten & contacten',true,true,true],['Offertes & orders',true,true,true],['Artikelbeheer','Basis','Volledig','Volledig + maatwerk'],['PDF-templates','3','Onbeperkt','Onbeperkt']] },
  { cat: 'Modules', rows: [['Voorraad & inkoop',false,true,true],['Configurator',false,true,true],['Klantportaal','+ €49',true,true],['Productieplanning',false,'+ €79',true],['Rapportage dashboard',false,true,true]] },
  { cat: 'Integraties', rows: [['Boekhoudkoppeling','1','Onbeperkt','Onbeperkt'],['API-toegang',false,true,true],['Webhooks',false,true,true],['SSO (SAML/OIDC)',false,false,true]] },
  { cat: 'Support', rows: [['E-mailsupport',true,true,true],['Telefonische support',false,true,true],['SLA met responsetijd',false,false,true],['Account manager',false,false,true]] },
]
</script>

<template>
  <section class="py-20">
    <div class="ms-container">
      <AppSectionHeading eyebrow="Vergelijking" align="center" class="mb-14">
        <template #title>Wat zit er in elk plan?</template>
      </AppSectionHeading>

      <div class="overflow-x-auto -mx-4 px-4">
        <div class="bg-white border border-slate-200 rounded-2xl overflow-hidden min-w-[640px]">
          <div class="grid border-b border-slate-200 bg-slate-50" style="grid-template-columns:2fr 1fr 1fr 1fr">
            <div class="px-6 py-5 text-[13px] font-semibold text-slate-500 uppercase tracking-wider">Functies</div>
            <div v-for="(n,i) in ['Starter','Professional','Enterprise']" :key="n" class="px-6 py-5 text-center text-[16px] font-semibold" :style="{ background: i===1?'#0F172A':'transparent', color: i===1?'#fff':'#0F172A' }">{{ n }}</div>
          </div>

          <template v-for="(category, ci) in categories" :key="category.cat">
            <div class="px-6 py-3.5 text-[12px] font-semibold text-teal-700 uppercase tracking-widest bg-slate-50" :class="ci>0?'border-t border-slate-200':''">{{ category.cat }}</div>
            <div v-for="(row, ri) in category.rows" :key="ri" class="grid border-t border-slate-100 items-center" style="grid-template-columns:2fr 1fr 1fr 1fr">
              <div class="px-6 py-3.5 text-sm text-slate-700">{{ row[0] }}</div>
              <div v-for="col in [1,2,3]" :key="col" class="px-6 flex justify-center items-center" style="min-height:48px" :style="{ background: col===2?'#0F172A':'transparent' }">
                <AppIcon v-if="row[col]===true"  name="check" :size="18" :color="col===2?'#5EEAD4':'#0D9488'" :stroke-width="2.2" />
                <AppIcon v-else-if="row[col]===false" name="minus" :size="16" :color="col===2?'#475569':'#CBD5E1'" :stroke-width="2" />
                <span v-else class="text-sm" :style="{ color: col===2?'#fff':'#334155' }">{{ row[col] }}</span>
              </div>
            </div>
          </template>
        </div>
      </div>
    </div>
  </section>
</template>
