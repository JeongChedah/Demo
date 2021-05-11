<template>
    <div>
        <div class="overflow-x-hidden overflow-y-auto fixed inset-0 z-50 outline-none focus:outline-none flex justify-center items-center mb-4">
            <div class=" h-96 border-0 rounded-md shadow-lg flex flex-col w-3/4 bg-darkgray outline-none focus:outline-none">
                <div class="flex justify-end">
                    <button class="close" type="button" @click="closeModal" > X </button>
                </div>
                <div class="pt-3 flex justify-center md:justify-center">
                    <h3 class="text-3xl uppercase text-white">skór</h3>
                </div>

                <div class=" bg-darkgray rounded-md px-4">
                    <form @submit.prevent="productForm">
                        <div class="flex flex-row justify-around mt-2 space-x-5">
                            <div class="mt-2 w-2/5 space-y-2">
                                <div>
                                    <label class="label">Product name: </label>
                                    <input  type="text" id="productName" name="productName"
                                    v-model.trim="productName"   class="font-medium rounded-md border-2 border-orange border-opacity-50y w-full px-3 py-2 focus:ring-2 focus:ring-orange"/>
                                    <p v-if="invalidProductName" class="error">"Please enter product name"</p>
                                </div>
                                <div>
                                    <label class="label">Type: </label>
                                    <input  type="text" id="productType" name="productType" placeholder="Men/Women"
                                    v-model.trim="productType"  class="font-medium rounded-md border-2 border-orange border-opacity-50y w-full px-3 py-2"/>
                                    <p v-if="invalidProductType" class="error">"Please enter product type"</p>
                                </div>
                                <div>
                                    <label class="label">Price: </label>
                                    <input  type="number"  placeholder=""
                                    v-model.trim="productPrice"  class="font-medium rounded-md border-2 border-orange border-opacity-50y w-full px-3 py-2"/>
                                    <p v-if="invalidProductPrice" class="error">"Please enter product price"</p>
                                </div>
                                <div>
                                    <label class="label">Size: </label>
                                    <input  type="text" id="productSize" name="productSize"
                                    v-model.trim="productSize"  class="font-medium rounded-md border-2 border-orange border-opacity-50y w-full px-3 py-2"/>
                                    <p v-if="invalidProductSize" class="error">"Please enter product size"</p>
                                </div>
                                <div>
                                    <label class="label">Date: </label>
                                    <input  type="Date" id="productDate" name="productDate" 
                                    v-model.trim="productDate"  class="font-medium text-left rounded-md border-2 border-orange border-opacity-50y w-full px-3 py-2"/>
                                    <p v-if="invalidProductDate" class="error">"Please enter product date"</p>
                                </div>
                            </div>
                            <div class="mt-2 w-3/5 space-y-1">
                                <div>
                                    <label class="label">Description: </label>
                                    <textarea rows="4" cols="50" type="text" id="productDescription" name="productDescription"
                                    placeholder="Enter product description ..." v-model.trim="productDescription"  class="w-full px-3 py-2 mb-1 h-52 font-medium text-left bg-white border-2 border-orange border-opacity-50y rounded-md"/>
                                    <p v-if="invalidProductDescription" class="error">"Please enter product description"</p>
                                </div>
                                <div>
                                    <label class="label">Brand: </label>
                                    <select id="brands"  v-model.trim="selectBrand"  name="brands" class="font-medium rounded-md border-2 border-orange border-opacity-50y w-full px-3 py-2" >  
                                        <option v-for="brand in brands" :value="brand"  :key="brand.brandId">{{ brand.brandName }}</option> 
                                    </select>
                                    <p v-if="invalidBrand" class="error">"Please select product brand"</p>
                                </div>
                                <div class=" pt-1.5">
                                    <label  class="label">Color: </label>
                                    <div class="flex grid grid-cols-10 justify-items-start">
                                        <div v-for="color in colors" :key="color.colorId"  >
                                            <input type="checkbox" v-model="selectColor" :value="color"/>
                                           <div class=" w-8 h-8 rounded-md mx-2" :style="{ background: color.colorName }"></div>
                                        </div>
                                    </div>
                                    <p v-if="invalidColors" class="error">"Please select product color"</p>
                                </div>
                            </div>
                        </div>

                        <div class="mt-4 mb-4 flex flex-col items-center space-y-2">
                            <label class="label">Choose a product picture (*.png, *.jpeg): </label>
                            <input type="file" class="text-white" accept="product.productImg/png" @change="selectPic" />
                            <div class="flex justify-center">
                                <img :src="imageUpload" class="object-cover h-60 w-30" />
                            </div>
                        </div>
                        <div class=" flex flex-row justify-center space-x-2 mt-4 mb-4">
                            <button class="bg-lavender hover:bg-lavender hover:text-white py-2 px-16 mx-2 rounded-full text-darkgray text-xl font-bold uppercase" @click="productForm" >
                                Edit
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
</template>

<script>
import imageUpload from "../assets/imageupload.png";
import ProductService from '../service/ProductService.js';

export default {
    name: "edit-product",
    props: ["imageDb", "id"],
    emits: ["close", "save-product"],
    data() {
        return {
            imageUpload: this.imageDb ? this.imageDb : imageUpload,
            brands: [],
            colors: [],
            product: [],
            imageFile: null,
            productImg: null,
            productName: "",
            productType: "",
            productPrice: null,
            productDate: "",
            productDescription: "",
            productSize: "",
            invalidProductName: false,
            invalidProductType: false,
            invalidProductPrice: false,
            invalidProductSize: false,
            invalidProductDate: false,
            invalidProductDescription: false,
            invalidBrands: false,
            invalidColors: false,
            selectBrand: null,
            selectColor: [],
            image: null,
            submitEdit: null,
            productId: this.id
        }
    },
    methods: {
        productForm() {
            this.invalidProductName = this.productName === "" ? true:false;
            this.invalidProductType = this.productType === "" ? true:false;
            this.invalidProductPrice = this.productPrice === null || this.productPrice === "" ? true : false;
            this.invalidProductSize = this.productSize === "" ? true:false;
            this.invalidProductDate = this.productDate === "" ? true:false;
            this.invalidProductDescription = this.productDescription === "" ? true:false;
            this.invalidBrands = this.selectBrand === null ? true:false;
            this.invalidColors = this.selectColor.length === 0 ? true:false;
            if(this.invalidProductName || this.invalidProductType || this.invalidProductPrice ||this.invalidProductSize ||
            this.invalidProductDate || this.invalidProductDescription || this.invalidBrands || this.invalidColors ) {
                return;
            }
            this.updateProduct();
            },
    updateProduct(update) {
            const formData = new FormData();
            this.productId = update.productId;
            let edit = {
                productId: this.productId,
                productName: this.productName,
                productType: this.productType,
                productSize: this.productSize,
                productPrice: this.productPrice,
                productDate: this.productDate,
                productImg: this.productImg,
                productDescription: this.productDescription,
                brands: this.selectBrand,
                colors: this.selectColor
            }
            const productData = JSON.stringify(edit);
            const blob = new Blob([productData], {
                type: 'application/json'
            });
            
            formData.append('file', this.imageFile);
            formData.append('newProduct', blob);
            
            ProductService.put("/edit/"+ this.productId, formData, {
                headers: {
                    'Content-Type' : 'multipart/form-data'
                }
            }).then(response => {
                response.status === 200 ? alert("Edit") : alert("Error")
            })
        },
      closeModal(){
            this.$emit("close", true);
        },
      selectPic(s) {
            const file = s.target.files[0];
            this.image = URL.createObjectURL(file);
            this.productImg = file.name;
            this.imageFile = file;
            let reader = new FileReader();
            reader.onload = (s) => {
                this.imageUpload = s.target.result;
            };
            reader.readAsDataURL(file);
        },
    
      listBrand(){
            ProductService.get("/brand").then(response => {
                this.brands = response.data;
            });
        },
      listColor(){
            ProductService.get("/color").then(response => {
                this.colors = response.data;
            })
        },
      editProduct(product) {
        this.productName = product.productName;
        this.productPrice = product.productPrice;
        this.productType = product.productType;
        this.productSize = product.productSize;
        this.productPrice = product.productPrice;
        this.productDate = product.productDate;
        this.productDescription = product.productDescription;
        this.selectBrand = product.brands;
        this.selectColor = product.colors;
        this.submitEdit = product;
      }

  },
    created() {
    this.listBrand();
    this.listColor();
    }
};
</script>
