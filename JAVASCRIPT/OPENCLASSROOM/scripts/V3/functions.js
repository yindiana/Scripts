function motsOuPhrases() {
    //Choix entre liste de mot ou de phrases
    choixMotsOuPhrases = prompt("Voulez-vous jouer avec des : mots ou phrases ?")
    switch (choixMotsOuPhrases) {
    case "mots":
        //Modification de la variable motUtilisateur
        motProposes = [...listeMots];
        break
    case "phrases":
        //Modification de la variable motUtilisateur
        motProposes = [...listePhrases];
        break
    default:
        motsOuPhrases()
    }
    return motProposes;
    }

function recupMotUtilisateur() {
    //Modification de la variable motUtilisateur
    motUtilisateur = prompt("Veuillez entrez : " + motProposes[i]);
    return motUtilisateur;
}

function comparaisonMotUtilisateur() {
    // structure conditionnelle 1 pour savoir si motUtilisateur est identique à motProposes[i] et incrémentation de la variable score
    if (motUtilisateur === motProposes[i]) {
        score += 1
    }
    return score;
}

function afficherResultat() {
    let resultat = score
    console.log("Votre résultat est de : " + resultat + " sur " + motProposes.length)
}

function boucleParseDictionnaire() {
    while (i < motProposes.length){
        recupMotUtilisateur()
        comparaisonMotUtilisateur()
        afficherResultat()
        i++
    }
}
