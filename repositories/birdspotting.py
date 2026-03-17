from fastapi import HTTPException
from sqlmodel import Session, select

from models.birds import Bird
from models.birdspotting import Birdspotting, BirdspottingCreate

class BirdspottingRepository:
    def __init__(self, session: Session):
        self.session = session

    def get_all(self):
        statement = select(Birdspotting)
        return self.session.exec(statement).all()

    def get_one(self, spotting_id: int):
        item = self.session.get(Birdspotting, spotting_id)
        if not item:
            raise HTTPException(status_code=404, detail="Birdspotting not found")
        return item

    def insert(self, payload: BirdspottingCreate):
        bird = self.session.get(Bird, payload.bird_id)

        if not bird:
            raise HTTPException(status_code=400, detail="Bird does not exist")

        item = Birdspotting.model_validate(payload)
        self.session.add(item)
        self.session.commit()
        self.session.refresh(item)
        return item