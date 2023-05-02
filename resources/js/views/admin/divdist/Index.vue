<template>
    <div>
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Division District List</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item">
                                <a href="#">Home</a>
                            </li>
                            <li class="breadcrumb-item active">Division District</li>
                        </ol>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">

                                <div class="card-tools">
                                    <button
                                        @click = "createDivDis"
                                        class="btn btn-success btn-md"
                                    >
                                        Add Division District
                                        <i class="fas fa-plus fa-fw"></i>
                                    </button>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- add user modal -->

        <div
            class="modal fade"
            id="addDivDistModal"
            tabindex="-1"
            role="dialog"
            aria-labelledby="addDivDistModal"
            aria-hidden="true"
        >
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addDistrictModal">
                            Add District <i class="fas fa-plus fa-fw"></i>
                        </h5>

                        <button
                            type="button"
                            class="close"
                            data-dismiss="modal"
                            aria-label="Close"
                            @click="closeModal"
                        >
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                     <form @submit.prevent="addDistrict()" @keydown="form.onKeydown($event)">
                        <div class="modal-body">
                            <div class="form-group">
                                    <label for="exampleInputEmail1"
                                        >Division Name</label
                                    >
                                    <input
                                        type="text"
                                        v-model="form.name"
                                        class="form-control"

                                        aria-describedby="emailHelp"
                                        placeholder="Enter Name"
                                        :class="{ 'is-invalid': form.errors.has('name') }"
                                    />
                                    <HasError :form="form" field="name" />
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1"
                                        >District</label
                                    >
                                <select class="form-control" v-model="form.division_id" :class="{ 'is-invalid': form.errors.has('division_id') }">
                                        <option value="" disabled selected>Select Division</option>
                                        <option :value="division.id" v-for="division in divisions" :key="division.id">{{division.name}}</option>
                                </select>
                                </div>
                                <HasError :form="form" field="division_id" />


                        </div>
                        <div class="modal-footer">
                            <button
                            @click="closeModal"
                                type="button"
                                class="btn btn-danger"
                                data-dismiss="modal"
                            >
                                Close
                            </button>

                             <button type="submit" class="btn btn-primary" :disabled="form.busy">
                                Submit
                            </button>
                        </div>
                     </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
   data(){
    return{
         form : new Form({
            id:'',
            name: '',
            division_id: ''
        }),
        districts: {},
        divisions: {},
        editMode : false
      }
   },

   mounted(){
        this.getDistrict();
        this.getDivision();
   },

    methods:{
        async getDivision(){
            await this.form.get('/admin/division')
            .then(res => {
                this.divisions = res.data
                this.$Progress.finish()
            })
            .catch(e => {
                this.$Progress.fail()
            })
        },
        async getDistrict(){
           this.$Progress.start()
           await this.form.get('/admin/district')
            .then(res => {
                this.districts = res.data
                this.$Progress.finish()
            })
            .catch(e => {
                this.$Progress.fail()
            })
        },
        async addDistrict(){
             this.$Progress.start()
            await this.form.post('/admin/district-store')
            .then(res => {
                if(this.form.successful){
                    $('#addDivDistModal').modal('hide')
                    toast.fire({
                        icon: 'success',
                        title: "District Created Successfully"
                    })

                    this.getDistrict();
                    this.$Progress.finish()
                }
            })
            .catch(e => {
                 this.$Progress.fail()
            })
        },

         closeModal(){
             $('#addDivDistModal').modal('hide')
        },
        createDivDis(){
            this.editMode = false;
            this.form.clear();
            this.form.reset();
            $('#addDivDistModal').modal('show')
        },

    }
};
</script>
