let generate = https://prelude.dhall-lang.org/List/generate
let subject : Text = "Конфигурационное управление"
let Student = 
{
name : Text,
group : Text,
age : Natural
}
let Config = 
{
groups : List Text,
sgroup : List Student,
subject : Text
}
let makegroup: Natural -> Text = \(group : Natural) -> "ИКБО-${Natural/show group}-19"
let makestudent : Text -> Natural -> Natural -> Student = \(name : Text) -> \(age : Natural) -> \(group : Natural) -> 
let student : Student = 
{
name = name,
group = makegroup group,
age = age
}
in student
let sgroup : List Student = 
[
makestudent "alex rubsov" 65 47,
makestudent "savva pos" 8 8,
makestudent "kirill ovchinnikov" 40 54
]
let groups = generate 24 Text (\(n: Natural) -> makegroup (n + 1))
 
let all : Config = 
{
	groups,
	sgroup,
	subject
}
in all
