<template>
  <div class="home">
    <div>
      <img class="inset-x-0 object-cover w-full" alt="group1" src="../assets/Group1.png">
    </div>

  <div class="flex justify-center mt-2">
    <img class="h-18 w-16" alt="scroll" src="../assets/scroll.png"  />
  </div>

  <div class="container mx-auto">
  <div class="flex flex-col md:flex-row items-center mt-2 md:-m-2">
    <div class="flex flex-wrap md:flex-row w-full md:w-1/2 lg:w-1/3">
      <div class="w-full p-1 md:p-2">
        <img class="h-full w-full rounded-md" alt="adidas" src="../assets/adidas.png" />
      </div>
    </div>
    <div class="flex flex-wrap md:flex-row w-full md:w-1/2 lg:w-1/3">
      <div class="w-full p-1 md:p-2">
        <img class="h-full w-full rounded-md " alt="nike" src="../assets/nike.png" />
      </div>
    </div>
    <div class="flex flex-wrap md:flex-row w-full md:w-1/2 lg:w-1/3">
      <div class="w-full p-1 md:p-2">
        <img class="h-full w-full rounded-md " alt="nb" src="../assets/nb.png" />
      </div>
    </div>
  </div>
  </div>

  <div class="flex justify-center mt-2">
    <img class="inset-x-0 pt-6 object-cover w-full" alt="group2" src="../assets/Group2.png"  />
  </div>

  <div class="flex justify-center mt-2">
    <p class="text-3xl text-gray-900 font-extrabold uppercase">recommend </p>
  </div>

  <div class="container mx-auto">
  <div class="flex flex-col md:flex-row items-center mt-2 ml-1">
    <div class="flex flex-wrap md:flex-row w-full md:w-1/2 lg:w-1/3">
      <div class="w-full p-1 md:p-2">
        <base-block>
          <img class="object-cover w-full lg:h-36 p-2 rounded-t-md border-gray-200 bg-gray-200" src="../assets/Airmax-90-4.png" />
          <div class="text-left pl-2 p-2">
            <p class="text-lg text-gray-500 font-medium"> Nike Air Max 90 </p>
            <p class=" text-sm text-gray-500 font-normal"> 4600 THB </p>
          </div>
        </base-block>
      </div>
    </div>

    <div class="flex flex-wrap md:flex-row w-full md:w-1/2 lg:w-1/3">
      <div class=" w-full p-1 md:p-2">
        <base-block>
          <img class="object-cover w-full lg:h-36 p-2 rounded-t-md border-gray-200 bg-gray-200" src="../assets/574-2.png" />
          <div class="text-left pl-2 p-2">
            <p class="text-lg text-gray-500 font-medium"> New Balance 574 </p>
            <p class=" text-sm text-gray-500 font-normal"> 2900 THB </p>
          </div>
        </base-block>
      </div>
    </div>

    <div class="flex flex-wrap md:flex-row w-full md:w-1/2 lg:w-1/3">
      <div class="w-full p-1 md:p-2">
        <base-block>
          <img class="object-cover w-full lg:h-36 p-2 rounded-t-md border-gray-200 bg-gray-200" src="../assets/Air-Flight.png" />
          <div class="text-left pl-2 p-2">
            <p class="text-lg text-gray-500 font-medium"> Nike Air Flight 89 </p>
            <p class=" text-sm text-gray-500 font-normal"> 6900 THB </p>
          </div>
        </base-block>
      </div>
    </div>

    <div class="flex flex-wrap md:flex-row w-full md:w-1/2 lg:w-1/3">
      <div class="w-full p-1 md:p-2">
        <base-block>
          <img class="object-cover w-full lg:h-36 p-2 rounded-t-md border-gray-200 bg-gray-200" src="../assets/NMDR1-1.png" />
          <div class="text-left pl-2 p-2">
            <p class="text-lg text-gray-500 font-medium"> Adidas NMD R1 </p>
            <p class=" text-sm text-gray-500 font-normal"> 4600 THB </p>
          </div>
        </base-block>
      </div>
    </div>
  </div>
  </div>
</div>
</template>

<script>


export default {
  name: 'Home',
  components: {
    
  }
}
</script>
