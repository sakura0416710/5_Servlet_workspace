package person.model.vo;

public class Person {
   private String name;
   private char gender;
   private int age;
   
   public Person() {}
   
   public Person(String name, char gender, int age) {
      super();
      this.name=name;
      this.gender = gender;
      this.age = age;
   }
//Alt + Shift + S 에서 찾을 수 있음
   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public char getGender() {
      return gender;
   }

   public void setGender(char gender) {
      this.gender = gender;
   }

   public int getAge() {
      return age;
   }

   public void setAge(int age) {
      this.age = age;
   }
      
   
   
   
}
