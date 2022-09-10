//  С помощью ООП и не только, опишите сущности и отношения между сущностями: Студент, Профессор, Оценка, Класс, Университет. Опишите по 3 функции или параметра в каждой сущности.

class Univerity {
    private var name: String
    private var rector: String
    private var institutes: [String]

    
    init(name: String, rector: String, institutes: [String]) {
        self.name = name
        self.rector = rector
        self.institutes = institutes
    }
    
    func getName() {
        print("Name of Univerity is \(name)")
    }
    
    func getNameOfRector() {
        print("Name of rector is \(rector)")
    }
    
    func getNamesOfInstitutes() {
        for institute in institutes {
            print(institute)
        }
    }
}

class Student {
    private var name: String
    private var group: String
    private var subjects: [String]
    var marks: [Mark]
    
    init(name: String, group: String, subjects: [String], marks: [Mark]) {
        self.name = name
        self.group = group
        self.subjects = subjects
        self.marks = marks
    }
    
    func getName() {
        print("Name of student is \(name)")
    }
    
    func getNameOfGroup() {
        print("Name of group is \(group)")
    }
    
    func getNamesOfSubjects() {
        for subject in subjects {
            print(subject)
        }
    }
}


class Professor {
    private var name: String
    private var subject: String
    private var university: String
    
    init(name: String, subject: String, university: String) {
        self.name = name
        self.subject = subject
        self.university = university
    }
    
    func getName() {
        print("Name of professor is \(name)")
    }
    
    func getNameOfSubject() {
        print("Name of subject is \(subject)")
    }
    
    func getNameOfUniversity() {
        print("Name of Univerity is \(name)")
    }
    
    func set(mark: Mark, student: Student) {
        student.marks
    }
}

enum Mark {
    case five, four, three, two, one
}

class Group {
    private var name: String
    private var leader: String
    private var institute: String
    
    init(name: String, leader: String, institute: String) {
        self.name = name
        self.leader = leader
        self.institute = institute
    }
    
    func getName() {
        print("Name of group is \(name)")
    }
    
    func getNameOfLeader() {
        print("Name of leader is \(leader)")
    }
    
    func getNameOfInstitute() {
        print("Name of institute is \(institute)")
    }
}


let university = Univerity(name: "KFU", rector: "Safin", institutes: ["ITIS", "VMK", "Mechmat"])
let student = Student(name: "Rishat", group: "11-104", subjects: ["iOS Lab", "Programming", "Terver"], marks: [.five, .four, .three, .two, .one])
let professor = Professor(name: "Abramskiy", subject: "Programming", university: "ITIS")
let group = Group(name: "11-104", leader: "Talova", institute: "ITIS")
