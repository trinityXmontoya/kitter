$.validator.addMethod("alphanumeric", function(val,el){
  return this.optional(el) || /^[a-zA-Z0-9]+$/.test(val);
});
