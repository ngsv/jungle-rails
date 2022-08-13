describe('Product Details', () => {
  beforeEach(() => {
    cy.visit("/");
    cy.get(".products-index").should("be.visible");
  });

  it('Navigates to the product detail page by clicking on a product', () => {
    cy.get("[alt='Giant Tea']").click();
    cy.get(".products-show").should("be.visible");
  });
});
