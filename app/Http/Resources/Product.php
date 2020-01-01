<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class Product extends JsonResource
{
   /**
    * Transform the resource into an array.
    *
    * @param  \Illuminate\Http\Request $request
    * @return array
    */
   public function toArray($request)
   {
      return [
        'id' => $this->id,
        'name' => $this->name,
        'detail' => $this->detail,
        'created_at' => $this->created_at->format('Y-m-d H:i:s'),
        'updated_at' => $this->updated_at->format('Y-m-d H:i:s'),
      ];
   }
}
