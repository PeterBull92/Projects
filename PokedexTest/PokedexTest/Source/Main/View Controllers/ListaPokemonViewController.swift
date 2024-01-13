//
//  ViewController.swift
//  PokedexTest
//
//  Created by Pedro Toro on 10/3/23.
//

import UIKit
// se removieron los outlets, se verifico quien tiene el class custom (si el files owner o el cell view) se verifico que el registro/dequeve este correcto (usar bien el identificador de la celda) y pusimos celdas dummy empty para comprobar que se muestren, dps implementar la custom
class ListaPokemonViewController: UIViewController {

// MARK - IBOutlets
    
    @IBOutlet weak var searchBarPokemon: UISearchBar!
    @IBOutlet weak var tablaPokemon: UITableView!

// Variables
    var pokemonManager = PokemonManager()
    var pokemons: [Pokemon] = []
    var selectedPokemon: Pokemon?
    var leakedPokemon: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    	//Registrar una Celda
        tablaPokemon.register(UINib(nibName: "PokemonTableViewCell", bundle: nil), forCellReuseIdentifier: "PokemonTableViewCell")
        
        searchBarPokemon.delegate = self
        pokemonManager.delegado = self
        tablaPokemon.delegate = self
        tablaPokemon.dataSource = self
        
        //Ejecutar el metodo para buscar la lista Pokemon
        pokemonManager.verPokemon()
    }
}

//MARK - SearchBar

extension ListaPokemonViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        leakedPokemon = []
        
        if searchText == "" {
            leakedPokemon = pokemons
        } else {
            for poke in pokemons {
                if poke.name.lowercased().contains(searchText.lowercased()) {
                    leakedPokemon.append(poke)
                }
            }
        }
        self.tablaPokemon.reloadData()
    }
}

// MARK - Delegado Pokemon

extension ListaPokemonViewController: pokemonManagerDelegado {
    func mostrarListaPokemon(lista: [Pokemon]) {
        pokemons = lista
        
        DispatchQueue.main.async {
            self.leakedPokemon = lista
            self.tablaPokemon.reloadData()
        }
    }
}

// MARK - Tabla
extension ListaPokemonViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leakedPokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let celda = tablaPokemon.dequeueReusableCell(withIdentifier: "PokemonTableViewCell", for: indexPath) as? PokemonTableViewCell else { return UITableViewCell() }
        
        celda.pokemonName.text = leakedPokemon[indexPath.row].name
        celda.pokemonAttack.text = "Attack: \(leakedPokemon[indexPath.row].attack)"
        celda.pokemonDefense.text = "Defense: \(leakedPokemon[indexPath.row].defense)"

        //Cell Image from URL
        if let urlString = leakedPokemon[indexPath.row].imageUrl as? String {
            if let imageURL = URL(string: urlString) {
                DispatchQueue.global().async {
                    guard let imageData = try? Data(contentsOf: imageURL) else { return }
                    let image = UIImage(data: imageData)
                    DispatchQueue.main.async {
                        celda.pokemonImage.image = image
                    }
                }
            }
        }
        
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedPokemon = leakedPokemon[indexPath.row]
        
        performSegue(withIdentifier: "verPokemon", sender: self)
        
        //Deseleccionar
        tablaPokemon.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "verPokemon" {
            let verPokemon = segue.destination as! DetallePokemonViewController
            verPokemon.pokemonShow = selectedPokemon
        }
    }
}
