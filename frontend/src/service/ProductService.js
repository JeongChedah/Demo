import axios from "axios";

// const API_URL = "http://localhost:9000";

// class ProductService {
//     retrieveAllProduct() {
//         return axios.get(`${API_URL}/product`);
//     }


// }

// export default new ProductService();

export default axios.create({
    // baseURL: "http://localhost:9000",
    baseURL: "http://40.65.142.182/backend",
    headers: {
        "Content-type": "application/json",
    }
});