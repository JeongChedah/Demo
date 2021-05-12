<template>
  <div class=" w-full  md:overflow-hidden">
    <div class="text-base px-5 pt-4 md:flex md:items-stretch md:justify-end ">
      <router-link to="/product" class="text-black hover:text-black">
        <button @click="toggleModal" class="hover:bg-black hover:text-pink py-3 px-3 mx-2 rounded-md text-darkgray text-xl font-bold">
          Add Product
        </button>
      </router-link>
    </div>

    <add-product v-if="showModal" @save-product="addNewProduct" @close="toggleModal">
    </add-product>
    <div v-if="showModal" class="show-modal"></div>
 
    <div class="grid md:grid-cols-3 sm:grid-cols-1 text-left justify-items-center  ">  
      <div v-for="p in product" :key="p.productId" :id="p.productId" class="mx-10 text-sm ">
        <div class="piece rounded-md">
        
        <img class="pic" :src="getProductImage(p.productImg)"/>
        <p class="mt-3">{{"Name: "+ p.productName }}</p>
      
        <p>{{"Description: "+ p.productDescription }}</p>

        <p>{{"Type: "+ p.productType}}</p>

        <p>{{"Size: "+ p.productSize }}</p>

        <p class="mb-3">{{"Brand: "+ p.brands.brandName }}</p>
        
        <div class="colorFormat">
        <div class="color rounded" v-for="color in p.colors" 
        :key="color.colorId" :style="{ background: color.colorName }">
        </div>
        </div>

        <p>{{"Date: "+ p.productDate}}</p>

        <p>{{"Price: "+ p.productPrice }}</p>

      <div >
        <button class="bg-black hover:bg-lavender py-1 px-3 rounded-md text-white " @click="openEditModal">
                Edit
        </button>

        <button class="bg-black hover:bg-rose py-1 px-3 mx-2 rounded-md text-white" @click="deleteProduct(p.productId)">
                Delete
        </button>
        </div>
        </div>
      </div>
 </div>
 <div class="md:grid-cols-3">
    <router-view @show="refreshList()" ></router-view>
  </div>
  </div>

  <edit-product v-if="editClicked" @close="changeEditItemClicked" @save-product="editProduct">
  </edit-product>
  <div v-if="editClicked" class="show-modal"></div>
 
</template>

<script>
import ProductService from '../service/ProductService';
import AddProduct from '../components/AddProduct.vue';
import EditProduct from '../components/EditProduct.vue';
export default {
  components: {
    AddProduct,
    EditProduct
  },
  props: ["productId"],
  data(){
    return {
      product: [],
      colors: [],
      brands: [],
      showModal: false,
      editClicked: false,
    };
  },
  methods: {
    toggleModal: function() {
      this.showModal = !this.showModal;
    },
    changeEditItemClicked(value) {
      this.editClicked = !value;
    },
    openEditModal(value) {
      this.editClicked = value;
    },
    retrieveProduct() {
      ProductService.get("/product")
      .then(response => {
        this.product = response.data;
      })
    },
    getProductImage(productImg){
      // return "http://localhost:9000/image/"+productImg;
      return "http://52.187.146.93/backend/image/"+productImg;
    },
    refreshList() {
      this.retrieveProduct();
    },
    deleteProduct(productId) {
      ProductService.delete("/delete/"+ productId) 
      .then(response => {
        this.product = response.data;
        this.refreshList();
        this.$router.push('/product');
      });
    },
  },
    created() {
    this.retrieveProduct();
   
  },
  //
};
</script>
<style>
.colorFormat {
  display: flex;
  width: 100%;
}
.color {
  width: 20px;
  height: 20px;
  margin-right: 10px;
  border-radius: 0px;
  margin-bottom: 15px;
}
.piece {
    width: 400px;
    height: 640px;
    border: 1px solid #F9BEC7;
    padding: 20px;
    margin-bottom: 20px;
    margin-top: 20px;
    background-color: #F9BEC7;
    box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
}
.pic {
  height: 80px;
  margin: auto;
  display: block;
}
</style>