package org.example;//package main.java.org.example;

//import java.sql.*;

import java.sql.*;

public class Main {
    public static void main( String[] args ) throws SQLException {
        String url = "jdbc:postgresql://localhost:5432/ ADD"; //add the correct database before running
        String user = "postgres";
        String password = ""; //input before running

        try (Connection myCon = DriverManager.getConnection(url, user, password)){
            System.out.println("Connected");

            try (Statement statement = myCon.createStatement()){

                //Inserts (no passing parameters as variables
                statement.executeUpdate("INSERT INTO \"BirthLocation\" (country, city, state)"+ "VALUES('USA', 'Chicago', 'Illinois')");
                statement.executeUpdate("INSERT INTO \"University\" (name, is_private, color)"+ "VALUES('University of Southern California', true, 'cardinal')");
                statement.executeUpdate("INSERT INTO \"Department\" (\"id_University\", name)"+ "VALUES(6, 'Filmmaking')");
                statement.executeUpdate("INSERT INTO \"Movie\" (title, release_time, date, rating, budget, gross)"+ "VALUES('Forrest Gump', '18:00:00', '1994-08-10', 9, 55000000, 678226465)");
                statement.executeUpdate("INSERT INTO \"Director\" (first_name, surname, year_of_birth, \"id_BirthLocation\", \"id_Movie\", \"id_University\")"+ "VALUES('Robert', 'Zemeckis', 1952, 11, 6, 6)");
                statement.executeUpdate("INSERT INTO \"BirthLocation\" (country, city, state)"+ "VALUES('USA', 'Concord', 'California')"); //Extra since Tom Hanks birth location
                statement.executeUpdate("INSERT INTO \"Actor\" (first_name, surname, year_of_birth, \"id_BirthLocation\", eye_color)"+ "VALUES('Tom', 'Hanks', 1956, 12, 'green')");
                statement.executeUpdate("INSERT INTO \"MovieActor\" (\"id_Movie\", \"id_Actor\")"+ "VALUES(6, 7)");
                statement.executeUpdate("INSERT INTO \"Genre\" (type)"+ "VALUES('Sci-Fi')");
                statement.executeUpdate("INSERT INTO \"MovieGenre\" (\"id_Movie\", \"id_Genre\")"+ "VALUES(6, 6)");
                statement.executeUpdate("INSERT INTO \"Cinema\" (cinema_name, location, type)"+ "VALUES('Landmark', 'Waterloo', '3D')");
                statement.executeUpdate("INSERT INTO \"Ticket\" (price, \"id_Cinema\")"+ "VALUES(10.25,6)");
                statement.executeUpdate("INSERT INTO \"ShowTime\" (show_name, show_time, show_duration, \"id_Cinema_Ticket\", \"id_Movie\")"+ "VALUES('Forrest Gump Screening', '18:00:00', 144, 6, 6)");
                statement.executeUpdate("INSERT INTO \"Award\" (award_name, \"id_Movie\")"+ "VALUES('Best Picture', 6)");
                statement.executeUpdate("INSERT INTO \"Category\" (category_name, \"award_id_Award\", \"id_Movie_Award\")"+ "VALUES('Overall Film Awards', 6, 6)");

            }

            try(PreparedStatement statement = myCon.prepareStatement("INSERT INTO \"BirthLocation\" (country,city,state) VALUES (?, ?, ?)")){
                statement.setString(1, "Canada");
                statement.setString(2, "Bracebridge");
                statement.setString(3, "Ontario");
                statement.executeUpdate();
            }

            try(PreparedStatement statement = myCon.prepareStatement("INSERT INTO \"University\" (name, is_private, color) VALUES (?, ?, ?)")){
                statement.setString(1, "Oxford University");
                statement.setBoolean(2,false);
                statement.setString(3, "oxford blue");
                statement.executeUpdate();
            }

            try(PreparedStatement statement = myCon.prepareStatement("INSERT INTO \"Department\" (\"id_University\", name) VALUES (?, ?)")){
                statement.setInt(1, 7);
                statement.setString(2,"Science");
                statement.executeUpdate();
            }

            try(PreparedStatement statement = myCon.prepareStatement("INSERT INTO \"Movie\" (title, release_time, date, rating, budget, gross) VALUES (?, ?, ?, ?, ?, ?)")){
                statement.setString(1, "American Psycho");
                statement.setTime(2, Time.valueOf("20:00:00"));
                statement.setDate(3, Date.valueOf("2000-04-14"));
                statement.setInt(4,8);
                statement.setInt(5,7000000);
                statement.setInt(6,34266679);
                statement.executeUpdate();
            }

            try(PreparedStatement statement = myCon.prepareStatement("INSERT INTO \"Director\" (first_name, surname, year_of_birth, \"id_BirthLocation\", \"id_Movie\", \"id_University\") VALUES (?, ?, ?, ?, ?, ?)")){
                statement.setString(1, "Mary");
                statement.setString(2,"Harron");
                statement.setInt(3,1953);
                statement.setInt(4,13);
                statement.setInt(5,7);
                statement.setInt(6,7);
                statement.executeUpdate();
            }

            try(PreparedStatement statement = myCon.prepareStatement("INSERT INTO \"Actor\" (first_name, surname, year_of_birth, \"id_BirthLocation\", eye_color) VALUES (?, ?, ?, ?, ?)")){
                statement.setString(1, "Bill");
                statement.setString(2,"Sage");
                statement.setInt(3,1962);
                statement.setInt(4,4);
                statement.setString(5,"brown");
                statement.executeUpdate();
            }

            try(PreparedStatement statement = myCon.prepareStatement("INSERT INTO \"MovieActor\" (\"id_Movie\", \"id_Actor\") VALUES (?, ?)")){
                statement.setInt(1, 7); //more then one input since American psycho has three genres
                statement.setInt(2,8);
                statement.addBatch();
                statement.setInt(1, 7);
                statement.setInt(2,3);
                statement.addBatch();
                statement.executeUpdate();
            }

            try(PreparedStatement statement = myCon.prepareStatement("INSERT INTO \"Genre\" (type) VALUES (?)")){
                statement.setString(1, "Horror");
                statement.executeUpdate();
            }

            try(PreparedStatement statement = myCon.prepareStatement("INSERT INTO \"MovieGenre\" (\"id_Movie\", \"id_Genre\") VALUES (?,?)")){
                statement.setInt(1, 7);
                statement.setInt(2, 8);
                statement.addBatch();
                statement.setInt(1, 7);
                statement.setInt(2, 2);
                statement.addBatch();
                statement.setInt(1, 7);
                statement.setInt(2, 6);
                statement.addBatch();
                statement.executeUpdate();
            }

            try(PreparedStatement statement = myCon.prepareStatement("INSERT INTO \"Cinema\" (cinema_name, location, type) VALUES (?, ?, ?)")){
                statement.setString(1, "Cineplex");
                statement.setString(2, "Pickering");
                statement.setString(3, "3D");
                statement.executeUpdate();
            }

            try(PreparedStatement statement = myCon.prepareStatement("INSERT INTO \"Ticket\" (price, \"id_Cinema\") VALUES (?, ?)")){
                statement.setDouble(1, 11.40);
                statement.setInt(2, 7);
                statement.executeUpdate();
            }

            try(PreparedStatement statement = myCon.prepareStatement("INSERT INTO \"ShowTime\" (show_name, show_time, show_duration, \"id_Cinema_Ticket\", \"id_Movie\") VALUES (?, ?, ?, ?, ?)")){
                statement.setString(1, "American Psycho Screening");
                statement.setTime(2, Time.valueOf("22:00:00"));
                statement.setInt(3,102);
                statement.setInt(4, 7);
                statement.setInt(5, 7);
                statement.executeUpdate();
            }

            try(PreparedStatement statement = myCon.prepareStatement("INSERT INTO \"Award\" (award_name, \"id_Movie\") VALUES (?, ?)")){
                statement.setString(1, "Best Movie");
                statement.setInt(2,7);
                statement.executeUpdate();
            }

            try(PreparedStatement statement = myCon.prepareStatement("INSERT INTO \"Category\" (category_name, \"award_id_Award\", \"id_Movie_Award\") VALUES (?, ?, ?)")){
                statement.setString(1, "International Horror Guild");
                statement.setInt(2,7);
                statement.setInt(3,7);
                statement.executeUpdate();
            }



            //Queries
            try (Statement statement = myCon.createStatement()) {
                //TASK 1 a)
                ResultSet resultSetOne =statement.executeQuery(
                        "SELECT first_name, surname " +
                                "FROM public.\"Director\" " +
                                "WHERE \"id_BirthLocation\" IN ( " +
                                    "SELECT id " +
                                    "FROM public.\"BirthLocation\" " +
                                    "WHERE country = 'Canada');");
                System.out.println("first_name surname");
                while(resultSetOne.next()){
                    System.out.println(resultSetOne.getString("first_name") + " " + resultSetOne.getString("surname"));
                }

                //TASK 1 f)
                String secondQuery = "SELECT first.surname AS first_surname, second.surname AS second_surname " +
                                "FROM public.\"Actor\" first, public.\"Actor\" second " +
                                "WHERE first.eye_color = ? AND second.eye_color = ? AND first.surname < second.surname;";
                PreparedStatement secondPreparedStatement = myCon.prepareStatement(secondQuery);
                secondPreparedStatement.setString(1, "blue");
                secondPreparedStatement.setString(2, "blue");
                ResultSet resultSetTwo = secondPreparedStatement.executeQuery();
                System.out.println("\nfirst_surname second_surname");
                while(resultSetTwo.next()){
                    System.out.println(resultSetTwo.getString("first_surname") + " " + resultSetTwo.getString("second_surname"));
                }

                //TASK 2 e)
                String thirdQuery ="SELECT AVG(rating) AS Average_Rating " +
                        "FROM public.\"Movie\" movie " +
                        "WHERE movie.id IN ( " +
                            "SELECT director.\"id_Movie\" " +
                            "FROM public.\"Director\" director " +
                            "INNER JOIN public.\"BirthLocation\" birth_location ON director.\"id_BirthLocation\" = birth_location.id " +
                            "WHERE birth_location.city = ? " +
                        ") OR  movie.id IN ( " +
                            "SELECT movie_actor.\"id_Movie\" " +
                            "FROM public.\"MovieActor\" movie_actor " +
                            "INNER JOIN public.\"Actor\" actor ON actor.id = movie_actor.\"id_Actor\" " +
                            "WHERE actor.eye_color = ? " +
                        ");";
                PreparedStatement thirdPreparedStatement = myCon.prepareStatement(thirdQuery);
                thirdPreparedStatement.setString(1, "Toronto");
                thirdPreparedStatement.setString(2, "blue");
                ResultSet resultSetThree = thirdPreparedStatement.executeQuery();
                System.out.println("\nAverage_Rating");
                while(resultSetThree.next()){
                    System.out.println(resultSetThree.getString("average_rating"));
                }

                //TASK 2 g :Database only has two actors from two different countries in titanic
                String fourthQuery = "SELECT title " +
                                "FROM public.\"Movie\" movie " +
                                "INNER JOIN public.\"MovieActor\" movie_actor ON movie.id = movie_actor.\"id_Movie\" " +
                                "INNER JOIN public.\"Actor\" actor ON actor.id = movie_actor.\"id_Actor\" " +
                                "INNER JOIN public.\"BirthLocation\" birth_location ON birth_location.id = actor.\"id_BirthLocation\" " +
                                "GROUP BY movie.title " +
                                "HAVING COUNT(DISTINCT birth_location.country) >= ?;";
                PreparedStatement fourthPreparedStatement = myCon.prepareStatement(fourthQuery);
                fourthPreparedStatement.setInt(1,2);
                ResultSet resultSetFour = fourthPreparedStatement.executeQuery();
                System.out.println("\nTitle");
                while(resultSetFour.next()){
                    System.out.println(resultSetFour.getString("title"));
                }
            }

        } catch (SQLException ex){
            System.err.println("SQLException: "+ ex.getMessage());
        }
    }
}
