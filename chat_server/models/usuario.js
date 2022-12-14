const{Schema, model}=require('mongoose');

const UsuarioSchema=Schema({
    nombre:{
        type:String,
        required:true
    },
    email:{
        type:String,
        required:true,
        unique:true
    },
    password:{
        type:String,
        required:true
    },
    isOnline:{
        type:Boolean,
        default:false
    },/*
    img:{
        type:String,
    },
    rol:{
        type:String,
        required:true,
        default:'USER_ROLE',
        emun:['ADMIN_ROLE','USER_ROLE']
    },
    estado:{
        type:Boolean,
        default:true
    },
    google:{
        type:Boolean,
        default:false
    }*/
});

UsuarioSchema.method('toJSON',function(){
    const{__v,_id,password,...object}=this.toObject();
    object.uid=_id;
    return object;
})

module.exports=model('Usuario',UsuarioSchema);