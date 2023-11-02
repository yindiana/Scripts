// pseudo code de l'algorithme
// Si le mot proposé est correct
// Alors points += 1

// Déclarez une variable listeMots qui est un tableau
let listeMots = ["Cachalot","Pétunia","Serviette"]

// Déclarez une deuxième variable score, initialisée à 0, qui contiendra le nombre de mots correctement tapés par l’utilisateur
let score = 0

// Déclarer une variable motUtilisateur qui sert à récupérer le mot de l'utilisateur
let motUtilisateur

for (let i = 0; i < 3; i++) {
    //Modification de la variable motUtilisateur
    motUtilisateur = prompt("Entrez le mot " + listeMots[i])
    // structure conditionnelle 1 pour savoir si motUtilisateur est identique à listeMots[i] et incrémentation de la variable score
    if (motUtilisateur === listeMots[i]) {
        score += 1
        console.log("bien joué ! Votre score est de " + score)
    } else {
        console.log("Vous avez fait une faute de frappe, vous avez écrit " + motUtilisateur + ". Votre score est de " + score)
    }
}
