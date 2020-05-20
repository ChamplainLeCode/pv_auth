<?php

$access = [
    "admin" => "admin",
    "boss" => "boss",
    "user" => "user"
];

header("Content-Type: application/json");

if(isset($_GET["matricule"]) && $_GET != NULL && isset($_GET["password"]) && $_GET["password"] != NULL){ 
    if($access[$_GET["matricule"]] == $_GET["password"]){
        if($_GET["matricule"] == "admin"){
            echo json_encode([
                "code" => 200,
                "access" => [
                    "/admin",
                    "/friends",
                    "/home",
                    "/photos",
                    "/privileges",
                    "/profile",
                    "/publication",
                    "/setting",
                    "/story",
                    "/users"
                ]
            ]);
        }elseif($_POST["matricule"] == "boss"){
            echo json_encode([
                "code" => 200,
                "access" => [
                    "/friends",
                    "/home",
                    "/photos",
                    "/privileges",
                    "/profile",
                    "/publication",
                    "/setting",
                    "/story",
                    "/users"
                ]
            ]);
        }else{
            echo json_encode([
                "code" => 200,
                "access" => [
                    "/friends",
                    "/home",
                    "/photos",
                    "/privileges",
                    "/profile",
                    "/publication",
                    "/setting",
                    "/story",
                ]
            ]);
        }
        exit(0);
    }
    echo json_encode([
        "error" => "Je te conseille de t'inscrire",
        "status" => 100
    ]);
} 
