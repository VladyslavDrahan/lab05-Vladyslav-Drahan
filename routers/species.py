from typing import Annotated
from fastapi import APIRouter, Depends
from sqlmodel import Session

from database import get_session
from models.species import Species, SpeciesCreate
from repositories.species import SpeciesRepository

router = APIRouter(prefix="/species", tags=["Species"])


def get_species_repository(
    session: Annotated[Session, Depends(get_session)],
) -> SpeciesRepository:
    return SpeciesRepository(session)


@router.get("/", response_model=list[Species], status_code=200)
async def get_species(
    repo: Annotated[SpeciesRepository, Depends(get_species_repository)],
):
    return repo.get_all()


@router.post("/", response_model=Species, status_code=201)
async def add_species(
    species: SpeciesCreate,
    repo: Annotated[SpeciesRepository, Depends(get_species_repository)],
):
    return repo.insert(species)