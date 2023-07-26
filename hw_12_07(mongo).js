
//Выведите средний балл по всем предметам для каждого студента.
//
db.students.aggregate([
  {
    $project: { _id: '$name', avgMark: { $avg: "$marks" } }
  }
]);

//
//Получите список студентов, у которых есть оценка ниже 3.
//
db.students.aggregate([
{
      $match: {marks:{$lt:3}}
}
])
//
//Подсчитайте количество студентов в каждом классе.
//
db.students.aggregate([
{
    $group:{
        _id: '$class',
        students:{$sum:1}
    }
}
])
//
//Рассчитайте суммарное количество оценок по каждому классу.
//


db.students.aggregate([
{
    $match:{}
},
{
    $group:{
        _id:'$class',
        totalMarks:{$sum:{$size:'$marks'}}
    }
}
])



//
//Рассчитайте средний балл для каждого студента.

db.students.aggregate([
{
    $project:{
        _id:0,  lastname:1,name:1, avgMarks:{$avg:'$marks'}
    }
}
])
