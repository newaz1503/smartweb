<template>
    <div>
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-3">
                        <h1>Division List</h1>
                    </div>
                    <div class="col-sm-3">
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
                                        @click = "createUser"
                                        class="btn btn-success btn-md"
                                    >
                                        Add User
                                        <i class="fas fa-user-plus fa-fw"></i>
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
                                            <th>Email</th>
                                            <th>Type</th>
                                            <th>Created At</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody v-if="users.length > 0">
                                        <tr v-for="(user,index) in users" :key="user.id">
                                            <td>{{index + 1}}</td>
                                            <td>{{index + 1}}</td>
                                            <td>{{index + 1}}</td>
                                            <td>{{index + 1}}</td>
                                            <td>{{index + 1}}</td>
                                            
                                            <td>
                                                <button
                                                    @click="editUser(user)"
                                                    class="btn btn-primary btn-sm"
                                                >
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                                <button
                                                    @click="deleteUser(user.id)"
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
            id="addUserModal"
            tabindex="-1"
            role="dialog"
            aria-labelledby="addUserModal"
            aria-hidden="true"
        >
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 v-if="editMode" class="modal-title" id="addUserModal">
                            edit User <i class="fas fa-user-edit fa-fw"></i>
                        </h5>
                        <h5 v-else class="modal-title" id="addUserModal">
                            Add User <i class="fas fa-user-plus fa-fw"></i>
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
                     <form @submit.prevent="editMode ? updateUser() : addUser()" @keydown="form.onKeydown($event)">
                        <div class="modal-body">
                                <AlertError :form="form" />
                                <div class="form-group">
                                    <label for="exampleInputEmail1"
                                        >User Type</label
                                    >
                                <select class="form-control" v-model="form.type" :class="{ 'is-invalid': form.errors.has('type') }">
                                        <option value="">Select Role</option>
                                        <option value="admin">Admin</option>
                                        <option value="author">Author</option>
                                        <option value="user">User</option>
                                </select>
                                </div>
                                <HasError :form="form" field="type" />

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
                                <div class="form-group">
                                    <label for="exampleInputEmail1"
                                        >Email address</label
                                    >
                                    <input
                                        type="email"
                                        v-model="form.email"
                                        class="form-control"

                                        aria-describedby="emailHelp"
                                        placeholder="Enter email"
                                        :class="{ 'is-invalid': form.errors.has('email') }"
                                    />
                                    <HasError :form="form" field="email" />
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1"
                                        >Password</label
                                    >
                                    <input
                                        type="password"
                                        v-model="form.password"
                                        class="form-control"

                                        aria-describedby="emailHelp"
                                        placeholder="Enter Password"
                                        :class="{ 'is-invalid': form.errors.has('password') }"
                                    />
                                    <HasError :form="form" field="password" />
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
                                Save changes
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
            type: '',
            name: '',
            email: '',
            password: '',
        }),
         search: '',
        users: {},
        editMode: false,

      }
   },

   mounted(){
        this.getUser();
        // setInterval(()=>  this.getUser(), 3000)
        Fire.$on('getNewUser',() => {
             this.getUser();
        })
   },

    methods:{
        async getUser(){
           this.$Progress.start()
           await this.form.get('/admin/user')
            .then(res => {
                this.users = res.data
                this.$Progress.finish()
            })
            .catch(e => {
                this.$Progress.fail()
            })
        },
        async addUser(){
             this.$Progress.start()
            await this.form.post('/admin/user-store')
            .then(res => {
                if(this.form.successful){
                    $('#addUserModal').modal('hide')
                    toast.fire({
                        icon: 'success',
                        title: "User Created Successfully"
                    })
                    Fire.$emit('getNewUser')
                    // this.getUser()
                    this.$Progress.finish()
                }
            })
            .catch(e => {
                 this.$Progress.fail()
            })
        },
        editUser(user){
            this.editMode = true;
            this.form.clear();
            this.form.reset();
            this.form.fill(user);
            $('#addUserModal').modal('show')
        },
        async updateUser(){
             this.$Progress.start()
             await this.form.put('/admin/user-update/'+this.form.id)
             .then(res=>{
                 if(this.form.successful){
                    $('#addUserModal').modal('hide')
                    toast.fire({
                        icon: 'success',
                        title: "User Updated Successfully"
                    })
                    Fire.$emit('getNewUser')
                    // this.getUser()
                    this.$Progress.finish()
                }
             })
             .catch(e=>{
                this.$Progress.fail()
             })

        },
         closeModal(){
             $('#addUserModal').modal('hide')
        },
        createUser(){
            this.editMode = false;
            this.form.clear();
            this.form.reset();
            $('#addUserModal').modal('show')
        },
        deleteUser(id){
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
                this.form.delete('/admin/user-delete/'+id)
                .then(res => {
                    swal.fire(
                    'Deleted!',
                    'Your file has been deleted.',
                    'success'
                    )
                     this.getUser();
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