const fdk=require('@fnproject/fdk');

fdk.handle(function(input, ctx){
  let name = 'World';
  if (input.name) {
    name = input.name;
  }
  console.log('\nInside Node Hello World function')
  return {'message': 'Hello ' + name ,'ctx':ctx}
})

