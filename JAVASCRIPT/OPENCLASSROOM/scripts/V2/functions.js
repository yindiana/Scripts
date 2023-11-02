function recupMotUtilisateur() {
    //Modification de la variable motUtilisateur
    motUtilisateur = prompt("Entrez le mot " + listeMots[i]);
    return motUtilisateur;
}

function comparaisonMotUtilisateur() {
    // structure conditionnelle 1 pour savoir si motUtilisateur est identique à listeMots[i] et incrémentation de la variable score
    if (motUtilisateur === listeMots[i]) {
        score += 1
    }
    return score;
}

function afficherResultat() {
    let resultat = score
    console.log("Votre résultat est de : " + resultat + " sur " + listeMots.length)
}

function boucleParseDictionnaire() {
    while (i < listeMots.length){
        recupMotUtilisateur()
        comparaisonMotUtilisateur()
        afficherResultat()
        i++
    }
}
