# Guide des Exemples - Templates LaTeX Dollarama

Ce guide explique les trois méthodes d'utilisation des templates avec des exemples concrets.

## 📁 Structure Actuelle

```
Template_Latex/
├── TemplateStatique/                    # Tous les templates modulaires
│   ├── dollarama_template.tex   # Template de base avec branding
│   ├── section_*.tex            # Sections modulaires
│   └── README_TEMPLATES.md      # Documentation complète
├── exemple_methode1_sans_copier.tex      # Méthode 1: Référence directe
├── exemple_methode2_structure_complete.tex # Méthode 2: Structure complète
├── exemple_methode3_document_minimal.tex   # Méthode 3: Document minimal
└── README_EXEMPLES.md           # Ce fichier
```

## 🚀 Trois Méthodes d'Utilisation

### Méthode 1: Sans Copier (Recommandée) ⭐

**Fichier:** `exemple_methode1_sans_copier.tex`

**Caractéristiques:**
- ✅ Aucune copie de fichiers nécessaire
- ✅ Templates centralisés et maintenables
- ✅ Mises à jour automatiques pour tous les projets
- ✅ Structure simple et claire

**Cas d'usage:** Idéal pour la majorité des projets

**Compilation:**
```bash
pdflatex -shell-escape exemple_methode1_sans_copier.tex
```

### Méthode 2: Structure Complète 📋

**Fichier:** `exemple_methode2_structure_complete.tex`

**Caractéristiques:**
- 📄 Utilise la structure complète du template principal
- 📊 Inclut toutes les sections standards
- 📝 Personnalisation du contenu principal
- 🔗 Référence toujours les sections modulaires

**Cas d'usage:** Business cases complets nécessitant toutes les sections

**Compilation:**
```bash
pdflatex -shell-escape exemple_methode2_structure_complete.tex
```

### Méthode 3: Document Minimal 🎯

**Fichier:** `exemple_methode3_document_minimal.tex`

**Caractéristiques:**
- 🚀 Ultra-léger et rapide
- 📄 Seulement les sections nécessaires
- ⚡ Pas de table des matières
- 🎨 Garde le branding Dollarama

**Cas d'usage:** Analyses rapides, mémos, documents courts

**Compilation:**
```bash
pdflatex -shell-escape exemple_methode3_document_minimal.tex
```

## 📊 Comparaison des Méthodes

| Critère | Méthode 1 | Méthode 2 | Méthode 3 |
|---------|-----------|-----------|-----------|
| Complexité | Faible | Moyenne | Très faible |
| Flexibilité | Haute | Moyenne | Haute |
| Sections incluses | Au choix | Toutes | Minimales |
| Temps de création | Rapide | Moyen | Très rapide |
| Maintenance | Centralisée | Centralisée | Centralisée |

## 💡 Recommandations

1. **Commencez avec la Méthode 1** pour la plupart des projets
2. **Utilisez la Méthode 2** uniquement pour des business cases formels complets
3. **Optez pour la Méthode 3** pour des documents rapides ou des preuves de concept

## 🔧 Compilation Rapide

Script pour compiler tous les exemples:
```bash
#!/bin/bash
# compile_exemples.sh
for file in exemple_methode*.tex; do
    echo "Compilation de $file..."
    pdflatex -shell-escape "$file"
    pdflatex -shell-escape "$file"
done
rm -f *.aux *.log *.out *.toc *.lof *.lot
echo "Tous les exemples sont compilés!"
```

## 📝 Notes Importantes

- **Ne modifiez jamais** les fichiers dans `TemplateStatique/`
- **Remplacez toujours** les placeholders `[...]` par vos données
- **Compilez deux fois** pour les références croisées
- **Gardez vos documents** dans le répertoire principal

## 🎯 Prochaines Étapes

1. Choisissez la méthode qui correspond à vos besoins
2. Copiez l'exemple correspondant: `cp exemple_methodeX.tex mon_projet.tex`
3. Personnalisez le contenu
4. Compilez avec `pdflatex -shell-escape`

---

*Pour plus de détails, consultez `TemplateStatique/README_TEMPLATES.md`*