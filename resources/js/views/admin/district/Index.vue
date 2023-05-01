<template>
    <div>
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-3">
                        <h1>District List</h1>
                    </div>
                    <div class="col-sm-3">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item">
                                <a href="#">Home</a>
                            </li>
                            <li class="breadcrumb-item active">District</li>
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
                                        @click = "createDistrict"
                                        class="btn btn-success btn-md"
                                    >
                                        Add District
                                        <i class="fas fa-plus fa-fw"></i>
                                    </button>
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table
                                    id="example2"
                                    class="table table-bordered table-hover"
                                >
                                    <thead>
                                        <tr>
                                            <th>SI</th>
                                            <th>Division</th>
                                            <th>Name</th>
                                            <th>Slug</th>
                                            <th>Created At</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody v-if="districts.length > 0">
                                        <tr v-for="(district,index) in districts" :key="district.id">
                                            <td>{{index + 1}}</td>
                                            <td v-if="district.division">{{district.division.name }}</td>
                                            <td>{{district.name | capitalize }}</td>
                                            <td>{{district.slug }}</td>
                                            <td>{{district.created_at | formatDate}}</td>
                                            
                                            <td>
                                                
                                                <button
                                                    @click="editDistrict(district)"
                                                    class="btn btn-primary btn-sm"
                                                >
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                                <button
                                                    @click="deleteDistrict(district.id)"
                                                    class="btn btn-danger btn-sm"
                                                >
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </tbody>

                                </table>
                            </div>
                            <!-- /.card-body -->
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
            id="addDistrictModal"
            tabindex="-1"
            role="dialog"
            aria-labelledby="addDistrictModal"
            aria-hidden="true"
        >
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 v-if="editMode" class="modal-title" id="addDistrictModal">
                            edit District <i class="fas fa-edit fa-fw"></i>
                        </h5>
                        <h5 v-else class="modal-title" id="addDistrictModal">
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
                     <form @submit.prevent="editMode ? updateDistrict() : addDistrict()" @keydown="form.onKeydown($event)">
                        <div class="modal-body">
                                <div class="form-group">
                                    <label for="exampleInputEmail1"
                                        >Division</label
                                    >
                                <select class="form-control" v-model="form.division_id" :class="{ 'is-invalid': form.errors.has('division_id') }">
                                        <option value="" disabled selected>Select Division</option>
                                        <option :value="division.id" v-for="division in divisions" :key="division.id">{{division.name}}</option>
                                </select>
                                </div>
                                <HasError :form="form" field="division_id" />
                                <div class="form-group">
                                    <label for="exampleInputEmail1"
                                        >Name</label
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
                            <button v-if="editMode" type="submit" class="btn btn-primary" :disabled="form.busy">
                                Update
                            </button>
                             <button v-else type="submit" class="btn btn-primary" :disabled="form.busy">
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
                    $('#addDistrictModal').modal('hide')
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
        editDistrict(district){
            this.editMode = true;
            this.form.clear();
            this.form.reset();
            this.form.fill(district);
            $('#addDistrictModal').modal('show')
        },
        async updateDistrict(){
             this.$Progress.start()
             await this.form.put('/admin/district-update/'+this.form.id)
             .then(res=>{
                 if(this.form.successful){
                    $('#addDistrictModal').modal('hide')
                    toast.fire({
                        icon: 'success',
                        title: "District Updated Successfully"
                    })
                     this.getDistrict();
                    this.$Progress.finish()
                }
             })
             .catch(e=>{
                this.$Progress.fail()
             })

        },
         closeModal(){
             $('#addDistrictModal').modal('hide')
        },
        createDistrict(){
            this.editMode = false;
            this.form.clear();
            this.form.reset();
            $('#addDistrictModal').modal('show')
        },
        deleteDistrict(id){
            swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
            if (result.isConfirmed) {
                this.form.delete('/admin/district-delete/'+id)
                .then(res => {
                    swal.fire(
                    'Deleted!',
                    'Your file has been deleted.',
                    'success'
                    )
                     this.getDistrict();
                      toast.fire({
                        icon: 'success',
                        title: "District Deleted Successfully"
                    })
                })
                .catch(error => {
                     swal.fire(
                    'Failed!',
                    'Something went wrong',
                    'warning'
                    )
                })

            }
            })
        }
    }
};
</script>