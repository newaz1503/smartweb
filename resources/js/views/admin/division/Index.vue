<template>
    <div>
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Division List</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item">
                                <a href="#">Home</a>
                            </li>
                            <li class="breadcrumb-item active">Division</li>
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
                                        @click = "createDivision"
                                        class="btn btn-success btn-md"
                                    >
                                        Add Division
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
                                            <th>Name</th>
                                            <th>Slug</th>
                                            <th>Created At</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody v-if="divisions.length > 0">
                                        <tr v-for="(division,index) in divisions" :key="division.id">
                                            <td>{{index + 1}}</td>
                                            <td>{{division.name | capitalize }}</td>
                                            <td>{{division.slug }}</td>
                                            <td>{{division.created_at | formatDate}}</td>
                                            
                                            <td>
                                                 <button
                                                    @click="showDistrict(division.id)"
                                                    class="btn btn-info btn-sm"
                                                >
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                                <button
                                                    @click="editDivision(division)"
                                                    class="btn btn-primary btn-sm"
                                                >
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                                <button
                                                    @click="deleteDivision(division.id)"
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
            id="addDivisionModal"
            tabindex="-1"
            role="dialog"
            aria-labelledby="addDivisionModal"
            aria-hidden="true"
        >
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 v-if="editMode" class="modal-title" id="addDivisionModal">
                            edit Division <i class="fas fa-edit fa-fw"></i>
                        </h5>
                        <h5 v-else class="modal-title" id="addDivisionModal">
                            Add Division <i class="fas fa-plus fa-fw"></i>
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
                     <form @submit.prevent="editMode ? updateDivision() : addDivision()" @keydown="form.onKeydown($event)">
                        <div class="modal-body">
                               
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
        <!-- show modal -->
     <div
            class="modal fade"
            id="showDistDivModal"
            tabindex="-1"
            role="dialog"
            aria-labelledby="showDistDivModal"
            aria-hidden="true"
        >
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" >
                            Show District <i class="fas fa-eye fa-fw"></i>
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
                     <form>
                        <div class="modal-body">
                               
                                <div class="form-group">
                                    <label for="exampleInputEmail1"
                                        >District Name</label
                                    >
                                    <div mt-3>
                                        <span class="btn btn-success btn-sm mr-1 mb-1" v-for="data in districtByDivision" :key="data.id">{{data.name}}</span>
                                    </div>
                                   
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
        }),
        divisions: {},
        districtByDivision : {},
        editMode : false
      }
   },

   mounted(){
        this.getDivision();
   },

    methods:{
        async showDistrict(id){
             this.$Progress.start()
           await this.form.get('/admin/district-by-division/'+id)
            .then(res => {
                this.districtByDivision = res.data
                 $('#showDistDivModal').modal('show')
                this.$Progress.finish()
            })
            .catch(e => {
                this.$Progress.fail()
            })
        },
        async getDivision(){
           this.$Progress.start()
           await this.form.get('/admin/division')
            .then(res => {
                this.divisions = res.data
                this.$Progress.finish()
            })
            .catch(e => {
                this.$Progress.fail()
            })
        },
        async addDivision(){
             this.$Progress.start()
            await this.form.post('/admin/division-store')
            .then(res => {
                if(this.form.successful){
                    $('#addDivisionModal').modal('hide')
                    toast.fire({
                        icon: 'success',
                        title: "Division Created Successfully"
                    })

                    this.getDivision();
                    this.$Progress.finish()
                }
            })
            .catch(e => {
                 this.$Progress.fail()
            })
        },
        editDivision(division){
            this.editMode = true;
            this.form.clear();
            this.form.reset();
            this.form.fill(division);
            $('#addDivisionModal').modal('show')
        },
        async updateDivision(){
             this.$Progress.start()
             await this.form.put('/admin/division-update/'+this.form.id)
             .then(res=>{
                 if(this.form.successful){
                    $('#addDivisionModal').modal('hide')
                    toast.fire({
                        icon: 'success',
                        title: "Division Updated Successfully"
                    })
                     this.getDivision();
                    this.$Progress.finish()
                }
             })
             .catch(e=>{
                this.$Progress.fail()
             })

        },
         closeModal(){
             $('#addDivisionModal').modal('hide')
               $('#showDistDivModal').modal('hide')
        },
        createDivision(){
            this.editMode = false;
            this.form.clear();
            this.form.reset();
            $('#addDivisionModal').modal('show')
        },
        deleteDivision(id){
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
                this.form.delete('/admin/division-delete/'+id)
                .then(res => {
                    swal.fire(
                    'Deleted!',
                    'Your file has been deleted.',
                    'success'
                    )
                     this.getDivision();
                     toast.fire({
                        icon: 'success',
                        title: "Division Deleted Successfully"
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