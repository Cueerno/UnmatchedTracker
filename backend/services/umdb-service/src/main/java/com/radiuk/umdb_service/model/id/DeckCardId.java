package com.radiuk.umdb_service.model.id;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.*;
import org.hibernate.Hibernate;

import java.io.Serial;
import java.io.Serializable;
import java.util.Objects;

@Getter
@Setter
@Builder
@Embeddable
@NoArgsConstructor
@AllArgsConstructor
public class DeckCardId implements Serializable {
    @Serial
    private static final long serialVersionUID = 4740612332803341004L;
    @Column(name = "deck_id")
    private Short deckId;

    @Column(name = "card_id")
    private Short cardId;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        DeckCardId entity = (DeckCardId) o;
        return Objects.equals(this.deckId, entity.deckId) &&
                Objects.equals(this.cardId, entity.cardId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(deckId, cardId);
    }

}