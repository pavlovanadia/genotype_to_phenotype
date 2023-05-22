#!/usr/bin/env python3

import os
from ontobio.ontol_factory import OntologyFactory

PATH_HPO = os.path.abspath("../ontologies/hpo.json")
PATH_MPO = os.path.abspath("../ontologies/mpo.json")

hpo = OntologyFactory().create(handle=PATH_HPO)
mpo = OntologyFactory().create(handle=PATH_MPO)

def replace_terms_by_level(terms, ontology_type, level_terms):
    """
    Takes list of terms, ontology type ('hp' or 'mp') 
    and list of target-level terms.
    Returns a list of target-level terms that are
    ancestors of input terms. 
    """

    result = set()
    level_terms_set = set(level_terms)
    
    if ontology_type == 'hp':
        for term in terms:
            if term == '':
                result.add('')
            if term in level_terms:
                result.add(term)
                continue

            parents = set(hpo.ancestors(term, reflexive=False))
            result_partial = level_terms_set.intersection(parents)
            result.update(result_partial)

    if ontology_type == 'mp':
        for term in terms:
            if term == '':
                result.add('')
            if term in level_terms:
                result.add(term)
                continue
            
            parents = set(mpo.ancestors(term, reflexive=False))
            result_partial = level_terms_set.intersection(parents)
            result.update(result_partial)

    return list(result)

